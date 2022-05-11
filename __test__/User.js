const { sequelize } = require("../models");
const request = supertest(app);

beforeAll(async () => {
  sequelize.constructor._cls = new Map();
});

beforeEach(async () => {
  const trx = await sequelize.transaction();
  sequelize.constructor._cls.set("transaction", trx);
});
afterEach(async () => {
  await sequelize.constructor._cls.get("transaction").rollback();
});

afterAll(() => {
  sequelize.close();
});