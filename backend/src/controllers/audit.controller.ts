import { prisma } from "../lib/prisma";
import { v4 as uuid } from "uuid";

export async function createAudit(req: any, res: any) {
  const { site, zone, service, date } = req.body;
  const code = "AUD-" + uuid().slice(0, 8).toUpperCase();
  const user = (req as any).user;
  const audit = await prisma.audit.create({
    data: {
      code,
      site,
      zone,
      service,
      date: new Date(date),
      authorId: user.sub
    }
  });
  res.json(audit);
}

export async function listAudits(req: any, res: any) {
  const user = (req as any).user;
  const audits = await prisma.audit.findMany({
    where: { authorId: user.sub },
    orderBy: { createdAt: "desc" }
  });
  res.json(audits);
}
