import express, { Application } from "express"
import cors from "cors"
import { userRoute } from "./router/user"
import { categoryRoute } from "./router/category"
import { projectRoute } from "./router/project"
import errorHandler from "./errors/errorHandler"

export const app : Application = express()


app.use(express.json())

app.use(cors())

app.use(userRoute)
app.use(categoryRoute)
app.use(projectRoute)

app.use(errorHandler)

