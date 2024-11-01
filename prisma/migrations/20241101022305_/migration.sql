-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NULL,
    `age` INTEGER NULL,
    `dob` DATETIME(3) NULL,
    `isUser` BOOLEAN NOT NULL DEFAULT true,
    `uid` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    UNIQUE INDEX `User_uid_key`(`uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BookingDetail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `status` VARCHAR(191) NOT NULL,
    `bookingId` INTEGER NOT NULL,
    `downloadRequired` BOOLEAN NOT NULL,
    `serviceUniqueId` VARCHAR(191) NOT NULL,
    `servicetype` VARCHAR(191) NOT NULL,
    `prefix` VARCHAR(191) NULL,
    `firstName` VARCHAR(191) NULL,
    `lastName` VARCHAR(191) NULL,
    `email` VARCHAR(191) NULL,
    `mobile` VARCHAR(191) NULL,
    `nationality` VARCHAR(191) NULL,
    `message` VARCHAR(191) NULL,
    `adult` INTEGER NULL,
    `child` INTEGER NULL,
    `infant` INTEGER NULL,
    `tourDate` VARCHAR(191) NULL,
    `timeSlotId` INTEGER NULL,
    `startTime` VARCHAR(191) NULL,
    `pickup` VARCHAR(191) NULL,
    `adultRate` DOUBLE NULL,
    `serviceTotal` DOUBLE NULL,
    `tourOption` VARCHAR(191) NULL,
    `tourname` VARCHAR(191) NULL,
    `childRate` DOUBLE NULL,
    `confirmationNo` VARCHAR(191) NULL,
    `bookingResultId` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `BookingDetail_bookingId_key`(`bookingId`),
    INDEX `BookingDetail_bookingResultId_fkey`(`bookingResultId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BookingResult` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `referenceNo` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(255) NOT NULL,
    `roleId` VARCHAR(255) NULL,
    `status` VARCHAR(255) NOT NULL DEFAULT 'Approved',

    UNIQUE INDEX `BookingResult_referenceNo_key`(`referenceNo`),
    INDEX `BookingResult_roleId_fkey`(`roleId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cart` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `totalamount` DOUBLE NULL,
    `uniqueNo` INTEGER NULL,
    `userId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Cart_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CartTourDetail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `serviceUniqueId` INTEGER NULL,
    `tourId` INTEGER NOT NULL,
    `optionId` INTEGER NOT NULL,
    `adult` INTEGER NOT NULL,
    `child` INTEGER NOT NULL,
    `infant` INTEGER NOT NULL,
    `tourDate` VARCHAR(191) NOT NULL,
    `timeSlotId` INTEGER NOT NULL,
    `startTime` VARCHAR(191) NOT NULL,
    `transferId` INTEGER NOT NULL,
    `pickup` VARCHAR(191) NULL,
    `adultRate` DOUBLE NOT NULL,
    `roleId` VARCHAR(191) NULL,
    `serviceTotal` DOUBLE NOT NULL,
    `cartId` INTEGER NOT NULL,
    `tourOption` VARCHAR(191) NOT NULL,
    `tourname` VARCHAR(191) NOT NULL,
    `childRate` DOUBLE NOT NULL,

    INDEX `CartTourDetail_cartId_fkey`(`cartId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `age` INTEGER NOT NULL,
    `adults` INTEGER NOT NULL,
    `children` INTEGER NOT NULL,
    `tourId` INTEGER NOT NULL,
    `amount` DOUBLE NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `status` VARCHAR(191) NOT NULL DEFAULT 'Approved',
    `username` VARCHAR(191) NOT NULL,

    INDEX `Order_tourId_fkey`(`tourId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TimeSlot` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tourOptionId` INTEGER NOT NULL,
    `timeSlotId` VARCHAR(191) NOT NULL,
    `timeSlot` VARCHAR(191) NOT NULL,
    `available` INTEGER NOT NULL,
    `adultPrice` DOUBLE NOT NULL,
    `childPrice` DOUBLE NOT NULL,

    UNIQUE INDEX `TimeSlot_id_key`(`id`),
    INDEX `TimeSlot_tourOptionId_fkey`(`tourOptionId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Continent` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Continent_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Country` (
    `CountryId` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `continentId` INTEGER NOT NULL,

    PRIMARY KEY (`CountryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `City` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `CityId` INTEGER NULL,
    `CityName` VARCHAR(191) NOT NULL,
    `countryId` INTEGER NOT NULL,

    UNIQUE INDEX `City_CityId_key`(`CityId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tourtypes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cityTourType` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Tourtypes_cityTourType_key`(`cityTourType`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tourstaticdata` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tourId` INTEGER NOT NULL,
    `countryId` INTEGER NOT NULL,
    `countryName` VARCHAR(191) NOT NULL,
    `cityId` INTEGER NOT NULL,
    `cityName` VARCHAR(191) NOT NULL,
    `tourName` VARCHAR(191) NOT NULL,
    `duration` VARCHAR(191) NOT NULL,
    `imagePath` VARCHAR(191) NOT NULL,
    `cityTourTypeId` VARCHAR(191) NOT NULL,
    `cityTourType` VARCHAR(191) NOT NULL,
    `contractId` INTEGER NOT NULL,
    `recommended` BOOLEAN NOT NULL,
    `isPrivate` BOOLEAN NOT NULL,
    `isvisible` BOOLEAN NOT NULL DEFAULT true,
    `isvisiblePopularTours` BOOLEAN NOT NULL DEFAULT false,
    `isvisibleReccomendedTours` BOOLEAN NOT NULL DEFAULT false,
    `isSlot` BOOLEAN NOT NULL,
    `isVendorTour` BOOLEAN NOT NULL DEFAULT false,
    `vendorUid` VARCHAR(191) NULL,

    UNIQUE INDEX `Tourstaticdata_tourId_key`(`tourId`),
    UNIQUE INDEX `Tourstaticdata_tourName_key`(`tourName`),
    INDEX `Tourstaticdata_cityId_fkey`(`cityId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tourstaticdatabyid` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `countryId` INTEGER NOT NULL,
    `countryName` VARCHAR(191) NOT NULL,
    `cityId` INTEGER NOT NULL,
    `cityName` VARCHAR(191) NOT NULL,
    `tourName` VARCHAR(191) NOT NULL,
    `duration` VARCHAR(191) NOT NULL,
    `imagePath` VARCHAR(191) NOT NULL,
    `cityTourTypeId` VARCHAR(191) NOT NULL,
    `cityTourType` VARCHAR(191) NOT NULL,
    `tourDescription` LONGTEXT NOT NULL,
    `tourInclusion` LONGTEXT NOT NULL,
    `tourShortDescription` LONGTEXT NOT NULL,
    `importantInformation` LONGTEXT NOT NULL,
    `itenararyDescription` LONGTEXT NOT NULL,
    `usefulInformation` LONGTEXT NOT NULL,
    `childAge` VARCHAR(191) NOT NULL,
    `infantAge` VARCHAR(191) NOT NULL,
    `infantCount` INTEGER NOT NULL,
    `isSlot` BOOLEAN NOT NULL,
    `onlyChild` BOOLEAN NOT NULL,
    `contractId` INTEGER NOT NULL,
    `startTime` VARCHAR(191) NOT NULL,
    `meal` VARCHAR(191) NULL,
    `googleMapUrl` VARCHAR(191) NULL,
    `tourExclusion` VARCHAR(191) NULL,
    `TourId` INTEGER NOT NULL,
    `cutOffhrs` INTEGER NULL DEFAULT 96,
    `vendorUid` VARCHAR(191) NULL,
    `isVendorTour` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `Tourstaticdatabyid_tourName_key`(`tourName`),
    UNIQUE INDEX `Tourstaticdatabyid_TourId_key`(`TourId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TourImagess` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tourId` INTEGER NOT NULL,
    `imagePath` VARCHAR(191) NOT NULL,

    INDEX `TourImagess_tourId_fkey`(`tourId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TourPricing` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tourId` INTEGER NOT NULL,
    `contractId` INTEGER NOT NULL,
    `amount` DOUBLE NOT NULL,
    `discount` DOUBLE NULL,
    `addPriceadult` DOUBLE NULL,
    `addPricechild` DOUBLE NULL,
    `addPriceinfant` DOUBLE NULL,
    `adultPrice` DOUBLE NULL,
    `childPrice` DOUBLE NULL,
    `infantPrice` DOUBLE NULL,

    UNIQUE INDEX `TourPricing_tourId_key`(`tourId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TourOption` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tourId` INTEGER NOT NULL,
    `optionName` VARCHAR(191) NOT NULL,
    `childAge` VARCHAR(191) NOT NULL,
    `infantAge` VARCHAR(191) NOT NULL,
    `optionDescription` VARCHAR(191) NOT NULL,
    `minPax` INTEGER NOT NULL,
    `maxPax` INTEGER NOT NULL,
    `duration` VARCHAR(191) NOT NULL,
    `isWithoutTransfers` BOOLEAN NOT NULL DEFAULT true,
    `isSharingTransfer` BOOLEAN NOT NULL DEFAULT true,
    `isPrivateTransfer` BOOLEAN NOT NULL DEFAULT true,
    `isPrivateBoatWithoutTransfers` BOOLEAN NOT NULL DEFAULT true,
    `isPvtYachtWithoutTransfers` BOOLEAN NOT NULL DEFAULT true,
    `tourOptionId` INTEGER NOT NULL,

    UNIQUE INDEX `TourOption_tourOptionId_key`(`tourOptionId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OperationDay` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tourId` INTEGER NOT NULL,
    `tourOptionId` INTEGER NOT NULL,
    `monday` INTEGER NOT NULL,
    `tuesday` INTEGER NOT NULL,
    `wednesday` INTEGER NOT NULL,
    `thursday` INTEGER NOT NULL,
    `friday` INTEGER NOT NULL,
    `saturday` INTEGER NOT NULL,
    `sunday` INTEGER NOT NULL,

    INDEX `OperationDay_tourOptionId_fkey`(`tourOptionId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Coupon` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `discount` DOUBLE NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `eventId` INTEGER NULL,
    `tourId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Homepage` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `detail` LONGTEXT NOT NULL,
    `gridsectionheading` VARCHAR(191) NOT NULL,
    `gridsectionsubheading` VARCHAR(191) NOT NULL,
    `heading1` VARCHAR(191) NOT NULL,
    `heading2` VARCHAR(191) NOT NULL,
    `heading3` VARCHAR(191) NOT NULL,
    `imagepath` VARCHAR(191) NULL,
    `subtitle` LONGTEXT NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `imagepath2` VARCHAR(191) NULL,
    `imagepath3` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BackgroundImage` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(191) NOT NULL,
    `isVisibleSlider` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Aboutus` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `imagepath` VARCHAR(191) NOT NULL,
    `imagepath2` VARCHAR(191) NOT NULL,
    `imagepath3` VARCHAR(191) NOT NULL,
    `heading1` VARCHAR(191) NOT NULL,
    `detail1` VARCHAR(191) NOT NULL,
    `heading2` VARCHAR(191) NOT NULL,
    `subheading2` VARCHAR(191) NOT NULL,
    `detail2` VARCHAR(191) NOT NULL,
    `subtitle` VARCHAR(191) NOT NULL,
    `text` LONGTEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Eventdata` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `isVisible` BOOLEAN NOT NULL DEFAULT true,
    `isVisibleHome` BOOLEAN NOT NULL DEFAULT false,
    `cityId` INTEGER NOT NULL,
    `eventName` VARCHAR(191) NOT NULL,
    `duration` VARCHAR(191) NOT NULL,
    `imagePath` VARCHAR(191) NOT NULL,
    `eventType` VARCHAR(191) NOT NULL,
    `isSlot` BOOLEAN NOT NULL,
    `onlyChild` BOOLEAN NOT NULL,
    `vendorUid` VARCHAR(191) NULL,
    `recommended` BOOLEAN NOT NULL,
    `eventdetailid` INTEGER NULL,

    UNIQUE INDEX `Eventdata_eventdetailid_key`(`eventdetailid`),
    INDEX `Eventdata_cityId_fkey`(`cityId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EventDetail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `eventName` VARCHAR(191) NOT NULL,
    `eventdetailid` INTEGER NOT NULL,
    `description` LONGTEXT NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `location` VARCHAR(191) NOT NULL,
    `googlemapurl` VARCHAR(191) NOT NULL,
    `minage` VARCHAR(191) NOT NULL,
    `moreinfo` LONGTEXT NOT NULL,
    `ticketinfo` LONGTEXT NOT NULL,
    `artistname` VARCHAR(191) NOT NULL,
    `artistimage` VARCHAR(191) NOT NULL,
    `lastbookingtime` DATETIME(3) NOT NULL,
    `eventSelling` BOOLEAN NOT NULL,
    `ischildallowed` BOOLEAN NOT NULL,
    `isadultallowed` BOOLEAN NOT NULL,
    `isinfantallowed` BOOLEAN NOT NULL,
    `duration` VARCHAR(191) NOT NULL,
    `vendorUid` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EventOption` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `eventId` INTEGER NOT NULL,
    `optionname` VARCHAR(191) NOT NULL,
    `adultprice` VARCHAR(191) NOT NULL,
    `childprice` VARCHAR(191) NOT NULL,
    `infantprice` VARCHAR(191) NOT NULL,
    `optiondescription` LONGTEXT NOT NULL,
    `available` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EventTimeSlots` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `eventOptionId` INTEGER NOT NULL,
    `timeSlot` VARCHAR(191) NOT NULL,
    `available` VARCHAR(191) NOT NULL,
    `adultPrice` VARCHAR(191) NOT NULL,
    `childPrice` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `EventTimeSlots_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EventImages` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `imagePath` VARCHAR(191) NOT NULL,
    `eventDetailId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EventTypes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `eventtype` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `EventTypes_eventtype_key`(`eventtype`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Roles` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uid` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `isAdmin` BOOLEAN NOT NULL DEFAULT true,
    `isVendor` BOOLEAN NOT NULL DEFAULT true,
    `email` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `age` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `license_number` VARCHAR(191) NOT NULL,
    `isApproved` BOOLEAN NOT NULL DEFAULT false,
    `country` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `services_description` VARCHAR(191) NOT NULL,
    `mobile` VARCHAR(191) NOT NULL,
    `vatDocument` VARCHAR(191) NULL,
    `bankDocument` VARCHAR(191) NULL,
    `document_tradelicense` VARCHAR(191) NOT NULL,
    `document_other` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `Roles_uid_key`(`uid`),
    UNIQUE INDEX `Roles_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RayanaApi` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `apikey` LONGTEXT NOT NULL,
    `baseurl` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StripeApi` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `secretapikey` LONGTEXT NOT NULL,
    `publishableapikey` LONGTEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Emailtemplate` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `subject` LONGTEXT NOT NULL,
    `body` LONGTEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ContactUs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Heading` VARCHAR(191) NOT NULL,
    `Subheading` VARCHAR(191) NOT NULL,
    `Subheading2` VARCHAR(191) NOT NULL,
    `Address` VARCHAR(191) NOT NULL,
    `mobilenumber` VARCHAR(191) NOT NULL,
    `Email` VARCHAR(191) NOT NULL,
    `Heading2` VARCHAR(191) NOT NULL,
    `Imagepath` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Footer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `logourl` VARCHAR(191) NOT NULL,
    `title1` VARCHAR(191) NOT NULL,
    `paymentimage` VARCHAR(191) NOT NULL,
    `copyright` VARCHAR(191) NOT NULL,
    `socialimage1` VARCHAR(191) NOT NULL,
    `socialimage2` VARCHAR(191) NOT NULL,
    `socialimage3` VARCHAR(191) NOT NULL,
    `socialimage4` VARCHAR(191) NOT NULL,
    `socialimageurl1` VARCHAR(191) NOT NULL,
    `socialimageurl2` VARCHAR(191) NOT NULL,
    `socialimageurl3` VARCHAR(191) NOT NULL,
    `socialimageurl4` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Experiences` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `heading` VARCHAR(191) NOT NULL,
    `imagepath` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FormSubmission` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `message` VARCHAR(191) NOT NULL,
    `mobilenumber` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TransferTypes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `transferName` VARCHAR(191) NOT NULL,
    `transferId` INTEGER NOT NULL,

    UNIQUE INDEX `TransferTypes_id_key`(`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `BookingDetail` ADD CONSTRAINT `BookingDetail_bookingResultId_fkey` FOREIGN KEY (`bookingResultId`) REFERENCES `BookingResult`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BookingResult` ADD CONSTRAINT `BookingResult_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `Roles`(`uid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BookingResult` ADD CONSTRAINT `BookingResult_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`uid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Cart` ADD CONSTRAINT `Cart_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`uid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CartTourDetail` ADD CONSTRAINT `CartTourDetail_cartId_fkey` FOREIGN KEY (`cartId`) REFERENCES `Cart`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_tourId_fkey` FOREIGN KEY (`tourId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TimeSlot` ADD CONSTRAINT `TimeSlot_tourOptionId_fkey` FOREIGN KEY (`tourOptionId`) REFERENCES `TourOption`(`tourOptionId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Country` ADD CONSTRAINT `Country_continentId_fkey` FOREIGN KEY (`continentId`) REFERENCES `Continent`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `City` ADD CONSTRAINT `City_countryId_fkey` FOREIGN KEY (`countryId`) REFERENCES `Country`(`CountryId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tourstaticdata` ADD CONSTRAINT `Tourstaticdata_vendorUid_fkey` FOREIGN KEY (`vendorUid`) REFERENCES `Roles`(`uid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tourstaticdata` ADD CONSTRAINT `Tourstaticdata_cityId_fkey` FOREIGN KEY (`cityId`) REFERENCES `City`(`CityId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tourstaticdatabyid` ADD CONSTRAINT `Tourstaticdatabyid_TourId_fkey` FOREIGN KEY (`TourId`) REFERENCES `Tourstaticdata`(`tourId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TourImagess` ADD CONSTRAINT `TourImagess_tourId_fkey` FOREIGN KEY (`tourId`) REFERENCES `Tourstaticdatabyid`(`TourId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TourPricing` ADD CONSTRAINT `TourPricing_tourId_fkey` FOREIGN KEY (`tourId`) REFERENCES `Tourstaticdata`(`tourId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TourOption` ADD CONSTRAINT `TourOption_tourId_fkey` FOREIGN KEY (`tourId`) REFERENCES `Tourstaticdatabyid`(`TourId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OperationDay` ADD CONSTRAINT `OperationDay_tourOptionId_fkey` FOREIGN KEY (`tourOptionId`) REFERENCES `TourOption`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Coupon` ADD CONSTRAINT `Coupon_eventId_fkey` FOREIGN KEY (`eventId`) REFERENCES `Eventdata`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Coupon` ADD CONSTRAINT `Coupon_tourId_fkey` FOREIGN KEY (`tourId`) REFERENCES `Tourstaticdata`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Eventdata` ADD CONSTRAINT `Eventdata_vendorUid_fkey` FOREIGN KEY (`vendorUid`) REFERENCES `Roles`(`uid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Eventdata` ADD CONSTRAINT `Eventdata_cityId_fkey` FOREIGN KEY (`cityId`) REFERENCES `City`(`CityId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventDetail` ADD CONSTRAINT `EventDetail_eventdetailid_fkey` FOREIGN KEY (`eventdetailid`) REFERENCES `Eventdata`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventOption` ADD CONSTRAINT `EventOption_eventId_fkey` FOREIGN KEY (`eventId`) REFERENCES `EventDetail`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventTimeSlots` ADD CONSTRAINT `EventTimeSlots_eventOptionId_fkey` FOREIGN KEY (`eventOptionId`) REFERENCES `EventOption`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventImages` ADD CONSTRAINT `EventImages_eventDetailId_fkey` FOREIGN KEY (`eventDetailId`) REFERENCES `EventDetail`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
