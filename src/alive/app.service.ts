import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
    getAlive(): object {
        return {
            message: "I am alive!",
            version: "1.0.0"
        };
    }

    getHello(): object {
        return {
            message: "Hello World!",
            version: "1.0.0"
        };
    }
}
