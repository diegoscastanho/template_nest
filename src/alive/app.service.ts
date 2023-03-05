import { Injectable } from '@nestjs/common';

import * as pack from '../../package.json';

@Injectable()
export class AppService {
    getAlive(): object {
        console.log(pack.version);
        return {
            message: "I am alive!",
            version: pack.version
        };
    }

    getHello(): object {
        // console.log(`Versão do NestJS: ${packageJson.version}`);
        console.log(pack.version);

        return {
            message: "Hello World!",
            version: pack.version
        };
    }
}
