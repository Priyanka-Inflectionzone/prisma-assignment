-- CreateTable
CREATE TABLE `users` (
    `userId` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `emailId` VARCHAR(191) NOT NULL,
    `PhoneNumber` VARCHAR(191) NOT NULL,
    `Age` INTEGER NOT NULL,
    `Gender` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`userId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
