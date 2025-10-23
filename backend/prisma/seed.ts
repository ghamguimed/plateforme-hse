import { PrismaClient, Role } from "@prisma/client";
import bcrypt from "bcryptjs";
const prisma = new PrismaClient();

async function main() {
  const password = await bcrypt.hash("Admin@123", 10);
  await prisma.user.upsert({
    where: { email: "admin@local" },
    update: {},
    create: {
      email: "admin@local",
      password,
      fullName: "Admin",
      role: Role.ADMIN
    }
  });
  console.log("Seed ok: admin@local / Admin@123");
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
}).finally(async () => {
  await prisma.$disconnect();
});
