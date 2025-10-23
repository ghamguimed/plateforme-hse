import { Router } from "express";
import { chat } from "../controllers/ai.controller";
import { auth } from "../middlewares/auth";

const router = Router();

// Protected route for AI chat
router.post("/chat", auth, chat);

export default router;
