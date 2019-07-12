import * as chai from "chai";

import { Given, Then, When } from "cucumber";

import axios from "axios";

const expect = chai.expect;

const apiBase = "http://jsonplaceholder.typicode.com";

let r: Promise<any>;

Given("the service is up and running", () => {
  axios.get(apiBase).then(res => {
    expect(res.status).to.equal(200);
  });
});

When(
  "I send a {word} request to the endpoint {string}",
  (method: string, ep: string) => {
    if (method === "GET") {
      r = axios.get(apiBase + ep);
    } else if (method === "POST") {
      r = axios.post(apiBase + ep);
    } else {
      r = axios.delete(apiBase + ep);
    }
  }
);

Then("I should see the correct data ID {int}", async (dataId: number) => {
  const res = await r;
  return expect(res.data.id).to.equal(dataId);
});

Then("I verify that the status is {int}", async (int: number) => {
  const res = await r;
  return expect(res.status).to.equal(int);
});
