import express, { Application } from "express";
import http, { Server } from "http";
import bodyParser from 'body-parser';
import {AppDataSource} from "./src/models/data-source";
import { APIRouter } from "./src/routers/API.router";
import 'dotenv/config';

const port = process.env.PORT || 3000;
const app: Application = express();

AppDataSource.initialize()
    .then(() => {
        console.log("Data Source has been initialized!")
    })
    .catch((err) => {
        console.error("Error during Data Source initialization:", err)
    });

app.set('views', './src/views');
app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.json());



app.use('/api', APIRouter);

const server: Server = http.createServer(app);

server.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
    console.log(`CreatePage is running at http://localhost:${port}/api/receipts/create`);
});