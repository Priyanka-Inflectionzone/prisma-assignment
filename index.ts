import { PrismaClient } from '@prisma/client'
import { clearScreenDown } from 'readline';

const prisma = new PrismaClient()

async function main() {

// const trainer = await prisma.staff.findFirst({
//     where:{
//         Salary : 20000
//     }
// })
//    console.dir(trainer, {depth:null});

//    const users = await prisma.user.findMany({
//     where: {
//       emailId: {
//         endsWith: "ymail.com"
//       }
//     }

// })

// console.table(users);

// const user1 = await prisma.user.create({
//     data: {
//         firstName : "Rohit" ,      
//         lastName  : "J",      
//         emailId   : 'rohit@jmail.com',      
//         Phone     : '9865321568',
//         Age       :  '22',      
//         Gender    :  'M',     
//         Institute_id : 1,
//         JoinedOn   : new Date('2022-04-07 00:00:00'), 
//         EndedOn    : null
//     },
//   })
//      console.table(user1);
// }
// const deleteUser = await prisma.user.delete({
//     where: {
//       UserId : 10
//     },
//   })

const user2 = await prisma.user.findFirst({
    where:{
        UserId : 10
    }
})
   console.dir(user2, {depth:null});

}

main();
