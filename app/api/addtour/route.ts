import { NextResponse } from 'next/server';
import { PrismaClient } from '@prisma/client';

// Initialize the Prisma client
const prismaClient = new PrismaClient();

// Define the parameter types for the tour creation
interface TourParams {
  countryid: number;
  countryname: string;
  cityid: number;
  cityname: string;
  continent :string
  tourname: string;
  duration: string;
  imagepath: string;
  citytourtypeid: string;
  citytourtype: string;
  vendoruid: string;
  isvendortour: boolean;
  isrecommended: boolean;
  isslot: boolean;
  amount: number;
  adultprice: number;
  childprice: number;
  infantprice: number;
  optionlist: TourOption[];
  imagepaths: string[];
  tourdescription?: string;
  tourinclusion?: string;
  shortdescription?: string;
  importantinformation?: string;
  itenararydescription?: string;
  usefulinformation?: string;
  childage?: string;
  infantage?: string;
  infantcount?: number;
  isonlychild?: boolean;
  starttime?: string;
  meal?: string;
  googlemapurl?: string;
  tourexclusion?: string;
}

interface TourOption {
  optionname: string;
  childage?: string;
  infantage?: string;
  optiondescription?: string;
  minpax: number;
  maxpax: number;
  duration: string;
  operationDays: {
    monday: number;
    tuesday: number;
    wednesday: number;
    thursday: number;
    friday: number;
    saturday: number;
    sunday: number;
  };
  timeSlots: TimeSlot[];
}

interface TimeSlot {
  timeSlot: string;
  available: number;
  adultPrice: number;
  childPrice: number;
}

// Tour User Module
const AddTourUser = {
  async generateUniqueTourId(): Promise<number> {
    const existingIds = await prismaClient.tourstaticdata.findMany({
      select: { tourId: true },
    });

    const existingIdSet = new Set(existingIds.map((idObj) => idObj.tourId));

    let newTourId: number;
    do {
      newTourId = Math.floor(Math.random() * 10000); // Adjust the range as needed
    } while (existingIdSet.has(newTourId));

    return newTourId;
  },

  async generateUniqueTourOptionId(): Promise<number> {
    const existingIds = await prismaClient.tourOption.findMany({
      select: { tourOptionId: true },
    });

    const existingOptionIdSet = new Set(existingIds.map((idObj) => idObj.tourOptionId));

    let newTourOptionId: number;
    do {
      newTourOptionId = Math.floor(Math.random() * 10000); // Adjust the range as needed
    } while (existingOptionIdSet.has(newTourOptionId));

    return newTourOptionId;
  },

  async generateUniqueTimeSlotId(): Promise<number> {
    const existingIds = await prismaClient.timeSlot.findMany({
      select: { id: true },
    });

    const existingTimeSlotIdSet = new Set(existingIds.map((idObj) => idObj.id));

    let newTimeSlotId: number;
    do {
      newTimeSlotId = Math.floor(Math.random() * 10000); // Adjust the range as needed
    } while (existingTimeSlotIdSet.has(newTimeSlotId));

    return newTimeSlotId;
  },

  async createTourUser(params: TourParams) {
    try {
      const gtourId = await this.generateUniqueTourId();

      await prismaClient.tourstaticdata.create({
        data: {
          tourId: gtourId,
          countryId: params.countryid,
          countryName: params.countryname,
          cityId: params.cityid,
          cityName: params.cityname,
          tourName: params.tourname,
          duration: params.duration,
          imagePath: params.imagepath,
          cityTourTypeId: params.citytourtypeid,
          cityTourType: params.citytourtype,
          continent:params.continent,
          vendorUid: params.vendoruid,
          isVendorTour: params.isvendortour,
          recommended: params.isrecommended,
          isSlot: params.isslot,
        },
      });

      // Add TourPricing
      try {
        await prismaClient.tourPricing.create({
          data: {
            tourId: gtourId,
        
            amount: params.amount,           
          },
        });
      } catch (error) {
        console.error('Error creating TourPricing:', error);
      }

      await prismaClient.tourstaticdatabyid.create({
        data: {
          TourId: gtourId,
          countryId: params.countryid,
          countryName: params.countryname,
          continent:params.continent,
          cityId: params.cityid,
          cityName: params.cityname,
          tourName: params.tourname,
          duration: params.duration,
          imagePath: params.imagepath,
          cityTourTypeId: params.citytourtypeid,
          cityTourType: params.citytourtype,
          isSlot: params.isslot,
          tourDescription: params.tourdescription??"none",
          tourInclusion: params.tourinclusion??"none",
          tourShortDescription: params.shortdescription??"none",
          importantInformation: params.importantinformation ??"none",
          itenararyDescription: params.itenararydescription?? "none",
          usefulInformation: params.usefulinformation ?? "none",
          childAge: params.childage?? "0",
          infantAge: params.infantage ?? "0",
          isVendorTour: params.isvendortour,
          infantCount: params.infantcount?? 0,
          onlyChild: params.isonlychild ?? false,
          startTime: params.starttime??"",
          meal: params.meal,
          googleMapUrl: params.googlemapurl,
          tourExclusion: params.tourexclusion,
          vendorUid: params.vendoruid,
        },
      });

      // Iterate over optionlist to create TourOption and related entities
      await Promise.all(
        params.optionlist.map(async (option) => {
          const gtourOptionId = await this.generateUniqueTourOptionId();
          console.log(gtourOptionId);

          const createdTourOption = await prismaClient.tourOption.create({
            data: {
              tourId: gtourId,
              tourOptionId: gtourOptionId,
              optionName: option.optionname,
              childAge: option.childage ??'',
              infantAge: option.infantage??'',
              optionDescription: option.optiondescription??'',
              minPax: option.minpax,
              maxPax: option.maxpax,
              
            },
          })
          const touroptionid = await createdTourOption.tourOptionId;
          console.log( {"hello":touroptionid})

          await prismaClient.operationDay.create({
            data: {
              tourId: gtourId,
              tourOptionId: touroptionid,
              monday: option.operationDays.monday,
              tuesday: option.operationDays.tuesday,
              wednesday: option.operationDays.wednesday,
              thursday: option.operationDays.thursday,
              friday: option.operationDays.friday,
              saturday: option.operationDays.saturday,
              sunday: option.operationDays.sunday,
            },
          });

          // Create TimeSlot for each TourOption
          await Promise.all(
            (option.timeSlots || []).map(async (timeSlot) => {
              const gtimeSlotId = await this.generateUniqueTimeSlotId();
              return prismaClient.timeSlot.create({
                data: {
                  tourOptionId: createdTourOption.tourOptionId,
                  timeSlotId: gtimeSlotId.toString(),
                  timeSlot: timeSlot.timeSlot,
                  available: timeSlot.available,
                  adultPrice: timeSlot.adultPrice,
                  childPrice: timeSlot.childPrice,
                },
              });
            })
          );
         })
      );

      // Save tour images
      await Promise.all(
        params.imagepaths.map(async (ImagePath) => {
          try {
            await prismaClient.tourImagess.createMany({
              data: {
                tourId: gtourId,
                imagePath: ImagePath,
              },
            });
          } catch (error) {
            console.error(`Error creating TourImagess: ${error}`);
          }
        })
      );

      return { status: 200, message: 'Tour user created successfully', tourId: gtourId };
    } catch (error) {
      console.error('Error in createTourUser:', error);
      throw new Error('Failed to create tour user');
    }
  },
};

// Next.js API Route Handler
export const POST = async (req: Request) => {
    try {
      const params: TourParams = await req.json(); // Parse JSON payload from the request
      const result = await AddTourUser.createTourUser(params);
      return NextResponse.json(result, { status: result.status });
    } catch (error: unknown) {
      if (error instanceof Error) {
        return NextResponse.json({ error: error.message }, { status: 500 });
      }
      return NextResponse.json({ error: 'An unknown error occurred' }, { status: 500 });
    }
  };
  export const Get = async () => {
    try {
       // Parse JSON payload from the request
      const result = await prismaClient.tourstaticdata.findMany();
      return NextResponse.json(result );
    } catch (error: unknown) {
      if (error instanceof Error) {
        return NextResponse.json({ error: error.message }, { status: 500 });
      }
      return NextResponse.json({ error: 'An unknown error occurred' }, { status: 500 });
    }
  };