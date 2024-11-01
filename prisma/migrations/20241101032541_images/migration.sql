/*
  Warnings:

  - Added the required column `image` to the `Tourtypes` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Continent` ADD COLUMN `image` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `Country` ADD COLUMN `image` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `Tourtypes` ADD COLUMN `image` VARCHAR(191) NOT NULL;
