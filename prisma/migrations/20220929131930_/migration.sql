/*
  Warnings:

  - You are about to drop the column `Institute_id` on the `users` table. All the data in the column will be lost.
  - Added the required column `EndDate` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Institute` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `JoiningDate` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `users` DROP FOREIGN KEY `users_Institute_id_fkey`;

-- AlterTable
ALTER TABLE `users` DROP COLUMN `Institute_id`,
    ADD COLUMN `EndDate` DATETIME(3) NOT NULL,
    ADD COLUMN `Institute` INTEGER NOT NULL,
    ADD COLUMN `JoiningDate` DATETIME(3) NOT NULL;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_Institute_fkey` FOREIGN KEY (`Institute`) REFERENCES `institute`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
