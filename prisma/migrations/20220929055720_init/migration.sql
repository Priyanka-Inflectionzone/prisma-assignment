-- CreateTable
CREATE TABLE `institute` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `InstituteName` VARCHAR(191) NOT NULL,
    `Address` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `userId` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `emailId` VARCHAR(191) NOT NULL,
    `PhoneNumber` INTEGER NOT NULL,
    `Age` INTEGER NOT NULL,
    `Gender` VARCHAR(191) NOT NULL,
    `Institute_id` INTEGER NOT NULL,

    UNIQUE INDEX `users_Institute_id_key`(`Institute_id`),
    PRIMARY KEY (`userId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `courses` (
    `CourseId` INTEGER NOT NULL AUTO_INCREMENT,
    `CourseName` VARCHAR(191) NOT NULL,
    `NumberOfStudents` INTEGER NOT NULL,
    `Trainer_id` INTEGER NOT NULL,

    UNIQUE INDEX `courses_Trainer_id_key`(`Trainer_id`),
    PRIMARY KEY (`CourseId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `staff` (
    `StaffId` INTEGER NOT NULL AUTO_INCREMENT,
    `StaffName` VARCHAR(191) NOT NULL,
    `StaffType` VARCHAR(191) NOT NULL,
    `Salary` INTEGER NOT NULL,

    PRIMARY KEY (`StaffId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_Institute_id_fkey` FOREIGN KEY (`Institute_id`) REFERENCES `institute`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `courses` ADD CONSTRAINT `courses_Trainer_id_fkey` FOREIGN KEY (`Trainer_id`) REFERENCES `staff`(`StaffId`) ON DELETE RESTRICT ON UPDATE CASCADE;
