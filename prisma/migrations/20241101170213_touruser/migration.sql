/*
  Warnings:

  - You are about to drop the column `license_number` on the `Roles` table. All the data in the column will be lost.
  - You are about to drop the column `duration` on the `TourOption` table. All the data in the column will be lost.
  - You are about to drop the column `addPriceadult` on the `TourPricing` table. All the data in the column will be lost.
  - You are about to drop the column `addPricechild` on the `TourPricing` table. All the data in the column will be lost.
  - You are about to drop the column `addPriceinfant` on the `TourPricing` table. All the data in the column will be lost.
  - You are about to drop the column `adultPrice` on the `TourPricing` table. All the data in the column will be lost.
  - You are about to drop the column `childPrice` on the `TourPricing` table. All the data in the column will be lost.
  - You are about to drop the column `contractId` on the `TourPricing` table. All the data in the column will be lost.
  - You are about to drop the column `infantPrice` on the `TourPricing` table. All the data in the column will be lost.
  - You are about to drop the column `contractId` on the `Tourstaticdata` table. All the data in the column will be lost.
  - You are about to drop the column `isPrivate` on the `Tourstaticdata` table. All the data in the column will be lost.
  - You are about to drop the column `contractId` on the `Tourstaticdatabyid` table. All the data in the column will be lost.
  - You are about to drop the `RayanaApi` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `CompanyNumber` to the `Roles` table without a default value. This is not possible if the table is not empty.
  - Added the required column `continent` to the `Tourstaticdata` table without a default value. This is not possible if the table is not empty.
  - Added the required column `continent` to the `Tourstaticdatabyid` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Roles` DROP COLUMN `license_number`,
    ADD COLUMN `CompanyNumber` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `TourOption` DROP COLUMN `duration`;

-- AlterTable
ALTER TABLE `TourPricing` DROP COLUMN `addPriceadult`,
    DROP COLUMN `addPricechild`,
    DROP COLUMN `addPriceinfant`,
    DROP COLUMN `adultPrice`,
    DROP COLUMN `childPrice`,
    DROP COLUMN `contractId`,
    DROP COLUMN `infantPrice`;

-- AlterTable
ALTER TABLE `Tourstaticdata` DROP COLUMN `contractId`,
    DROP COLUMN `isPrivate`,
    ADD COLUMN `Alwaysavailable` BOOLEAN NOT NULL DEFAULT true,
    ADD COLUMN `Endingdate` VARCHAR(191) NULL,
    ADD COLUMN `Startingdate` VARCHAR(191) NULL,
    ADD COLUMN `continent` VARCHAR(191) NOT NULL,
    MODIFY `duration` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `Tourstaticdatabyid` DROP COLUMN `contractId`,
    ADD COLUMN `continent` VARCHAR(191) NOT NULL,
    MODIFY `childAge` VARCHAR(191) NULL,
    MODIFY `infantAge` VARCHAR(191) NULL;

-- DropTable
DROP TABLE `RayanaApi`;
