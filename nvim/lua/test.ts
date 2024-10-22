interface IModel {
  name: string;
  age: number;
  address: string;
}

class model implements IModel {
  name: string;
  age: number;
  address: string;
  constructor(name: string, age: number, address: string) {
    this.name = name;
    this.age = age;
    this.address = address;
  }
}

const a = new model("John", 25, "USA");
var b = new model("John", 25, "USA");

