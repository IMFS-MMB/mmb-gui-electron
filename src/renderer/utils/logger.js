import winston from 'winston';
import { isProduction } from '../../constants';

const logger = winston.createLogger({
  level: isProduction ? 'warn' : 'debug',
  format: winston.format.json(),
  transports: [
    new winston.transports.Console({
      format: winston.format.simple(),
    }),
  ],
});

export default logger;
