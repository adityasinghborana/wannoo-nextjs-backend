-- DropForeignKey
ALTER TABLE `OperationDay` DROP FOREIGN KEY `OperationDay_tourOptionId_fkey`;

-- AddForeignKey
ALTER TABLE `OperationDay` ADD CONSTRAINT `OperationDay_tourOptionId_fkey` FOREIGN KEY (`tourOptionId`) REFERENCES `TourOption`(`tourOptionId`) ON DELETE CASCADE ON UPDATE CASCADE;
