import { Router } from "express";
import { createAudit, listAudits } from "../controllers/audit.controller";
import { auth } from "../middlewares/auth";
import { rbac } from "../middlewares/rbac";

const router = Router();

// Create an audit (only certain roles)
router.post("/", auth, rbac(["AUDITEUR_HSE", "CHEF_PROJET_AUDITEUR", "ADMIN"]), createAudit);

// List audits for current user
router.get("/", auth, listAudits);

export default router;
