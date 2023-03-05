import { Controller, Get } from '@nestjs/common';

import { AppService } from './app.service';

@Controller()
export class AppController {
    constructor(private readonly appService: AppService) { }

    @Get("alive")
    getAlive(): object {
        return this.appService.getAlive();
    }

    @Get()
    getHello(): object {
        return this.appService.getAlive();
    }
}
