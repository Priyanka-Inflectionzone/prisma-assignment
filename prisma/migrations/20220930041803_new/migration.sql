/*
  Warnings:

  - The primary key for the `staff` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `StaffName` on the `staff` table. All the data in the column will be lost.
  - You are about to drop the `courses` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[StaffId]` on the table `staff` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `courses` DROP FOREIGN KEY `courses_Trainer_id_fkey`;

-- AlterTable
ALTER TABLE `staff` DROP PRIMARY KEY,
    DROP COLUMN `StaffName`,
    MODIFY `StaffId` INTEGER NOT NULL;

-- DropTable
DROP TABLE `courses`;

-- CreateTable
CREATE TABLE `user` (
    `UserId` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `emailId` VARCHAR(191) NOT NULL,
    `Phone` VARCHAR(191) NOT NULL,
    `Age` VARCHAR(191) NOT NULL,
    `Gender` VARCHAR(191) NOT NULL,
    `Institute_id` INTEGER NOT NULL,
    `JoinedOn` DATETIME(3) NOT NULL,
    `EndedOn` DATETIME(3) NOT NULL,

    PRIMARY KEY (`UserId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `course` (
    `CourseId` INTEGER NOT NULL AUTO_INCREMENT,
    `CourseName` VARCHAR(191) NOT NULL,
    `NumberOfStudents` INTEGER NOT NULL,
    `Trainer_id` INTEGER NOT NULL,

    PRIMARY KEY (`CourseId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Student` (
    `StudentId` INTEGER NOT NULL,
    `EnrolledFor` INTEGER NOT NULL,

    UNIQUE INDEX `Student_StudentId_key`(`StudentId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `staff_StaffId_key` ON `staff`(`StaffId`);

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_Institute_id_fkey` FOREIGN KEY (`Institute_id`) REFERENCES `institute`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `course` ADD CONSTRAINT `course_Trainer_id_fkey` FOREIGN KEY (`Trainer_id`) REFERENCES `staff`(`StaffId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `staff` ADD CONSTRAINT `staff_StaffId_fkey` FOREIGN KEY (`StaffId`) REFERENCES `user`(`UserId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_StudentId_fkey` FOREIGN KEY (`StudentId`) REFERENCES `user`(`UserId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_EnrolledFor_fkey` FOREIGN KEY (`EnrolledFor`) REFERENCES `course`(`CourseId`) ON DELETE RESTRICT ON UPDATE CASCADE;
