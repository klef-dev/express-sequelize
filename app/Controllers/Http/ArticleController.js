const User = require("../../Models/User");
const Article = require("../../Models/Article");

module.exports = class ArticleController {
  static async index(request, response) {
    try {
      const articles = await Article.findAll();
      response.json({ articles });
    } catch (error) {
      response.json({ error });
    }
  }
  static async create(request, response) {
    let id = 1;
    let { topic, body, image, btn_text } = request.body;
    const errors = [];
    if (!topic) {
      errors.push({ text: "Provide a topic", field: "topic" });
    }
    if (!body) {
      errors.push({ text: "Enter content in the body field", field: "body" });
    }
    if (!image) {
      image = "/uploads/image.png";
    }
    if (!btn_text) {
      btn_text = "Read More";
    }
    if (errors.length > 0) {
      return response.json(errors);
    }
    try {
      const user = await User.findOne({ where: { id } });
      if (!user) {
        return response
          .status(401)
          .json({ msg: "Unauthorized access", error: true });
      }
      try {
        const article = await Article.create({
          topic,
          body,
          image,
          btn_text
        });
        try {
          await user.addArticles(article);
          response.json({ article });
        } catch (error) {
          response.json({ msg: "Couldn't add article", error: true });
        }
      } catch (error) {
        response.json({ msg: "Couldn't create an article", error: true });
      }
    } catch (error) {
      response.json({ msg: "Couldn't fetch user", error: true });
    }
  }
  static async edit(request, response) {}
  static async destroy(request, response) {}
};
