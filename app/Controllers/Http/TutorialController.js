const { verifyJWT } = require("../../Middleware/verifyToken");
const Tutorial = require("../../Models/Tutorial");

class TutorialController {
  static async index(request, response) {
    try {
      const tutorials = await Tutorial.findAll();
      response.json(tutorials);
    } catch (err) {
      response.json({ err });
    }
  }

  static async single(request, response) {
    const { id } = request.params;
    try {
      const tutorial = await Tutorial.findOne({ where: { id } });
      if (!tutorial) {
        return response.json({ msg: "Can not find tutorial", error: true });
      }
      response.json(tutorial);
    } catch (error) {
      response.json({ error });
    }
  }

  static async create(request, response) {
    try {
      await verifyJWT(request.token);
      let {
        name,
        venue,
        description,
        course_code,
        image,
        day,
        time
      } = request.body;

      const errors = [];

      if (!name) {
        errors.push({ text: "Please enter your name", field: "name" });
      }
      if (!venue) {
        errors.push({
          text: "Please provide a venue for your audience",
          field: "venue"
        });
      }
      if (!course_code) {
        errors.push({
          text: "Please enter a course code",
          field: "course_code"
        });
      }
      if (!day) {
        errors.push({ text: "Please enter a day", field: "day" });
      }
      if (!time) {
        errors.push({ text: "Please enter a time", field: "time" });
      }

      if (errors.length > 0) {
        response.json(errors);
      } else {
        try {
          const tutorial = await Tutorial.create({
            name,
            venue,
            description,
            course_code,
            image,
            day,
            time
          });
          response.json({ tutorial });
        } catch (error) {
          response.json({ error });
        }
      }
    } catch (error) {
      response.json({ error });
    }
  }

  static async edit(request, response) {
    const { id } = request.params;
    try {
      await verifyJWT(request.token);
      let {
        name,
        venue,
        description,
        course_code,
        image,
        day,
        time
      } = request.body;

      const errors = [];

      if (!name) {
        errors.push({ text: "Please enter your name", field: "name" });
      }
      if (!venue) {
        errors.push({
          text: "Please provide a venue for your audience",
          field: "venue"
        });
      }
      if (!course_code) {
        errors.push({
          text: "Please enter a course code",
          field: "course_code"
        });
      }
      if (!day) {
        errors.push({ text: "Please enter a day", field: "day" });
      }
      if (!time) {
        errors.push({ text: "Please enter a time", field: "time" });
      }

      if (errors.length > 0) {
        return response.json(errors);
      }
      try {
        const tutorial = await Tutorial.findOne({ where: { id } });
        if (!tutorial) {
          return response.json({ msg: "Can not find tutorial", error: true });
        }
        await tutorial.update({
          name,
          venue,
          description,
          course_code,
          image,
          day,
          time
        });
        response.json({ msg: "Update successfully", tutorial });
      } catch (error) {
        response.json({ error });
      }
    } catch (error) {
      response.json({ error });
    }
  }

  static async destroy(request, response) {
    const { id } = request.params;
    try {
      const tutorial = await Tutorial.findOne({ where: { id } });
      if (!tutorial) {
        return response.json({ msg: "No tutorial found", error: true });
      }
      tutorial.destroy();
      return response.json({ tutorial });
    } catch (error) {
      response.json({ error });
    }
  }
}
module.exports = TutorialController;
