import 'dotenv/config';
declare const process: { env: { [key: string]: string | undefined } };

const config = {
  development: {
    client: 'postgresql',
    connection: process.env.DATABASE_URL,
    migrations: {
      directory: '../database/migrations',
    },
    seeds: {
      directory: '../database/seeds',
    },
  },
};

export default config.development;