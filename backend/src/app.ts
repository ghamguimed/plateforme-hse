import express from "express";
import cors from "cors";
import helmet from "helmet";
import morgan from "morgan";
import authRoutes from "./routes/auth.routes";
import aiRoutes from "./routes/ai.routes";
import auditRoutes from "./routes/audit.routes";

const app = express();
app.use(cors());
app.use(helmet());
app.use(express.json({ limit: "10mb" }));
app.use(morgan("dev"));

app.use("/auth", authRoutes);
app.use("/ai", aiRoutes);
app.use("/audits", auditRoutes);

export default app;
