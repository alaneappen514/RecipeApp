describe("Recipe CRUD Operations", () => {
  beforeEach(() => {
    cy.login();
  });

  //CREATE//
  describe("Create Recipe", () => {
    beforeEach(() => {
      cy.get(".fa-plus").click();
    });

    const verifyNewRecipe = () => {
      cy.contains("By:Someone");
      cy.contains("Chicken Parmesan");
      cy.contains(
        "4 skinless chicken breasts halves, 1/2 cup Parmesan cheese, 1 cup panko bread crumbs, pinch of salt"
      );
      cy.contains(
        "Place chicken breasts between two sheets of heavy plastic (resealable freezer bags work well) on a solid, level surface." +
          "Firmly pound chicken with the smooth side of a meat mallet to a thickness of 1/2-inch. Season chicken thoroughly with salt and pepper."
      );
    };

    it("should throw errors when creating recipe with no inputs", () => {
      cy.get(".btn").contains("Create Recipe").click();
      cy.contains("Title can't be blank");
      cy.contains("Ingredients can't be blank");
      cy.contains("Description can't be blank");
      cy.contains("Title is too short (minimum is 2 characters)");
    });

    it("should throw error with wrong input", () => {
      cy.get("#recipe_title").type(
        "dhfkshjdkhfskhakhjskajhfjdskfhdjskdfsdfssdf"
      );
      cy.get("#recipe_ingredients").type("dfs");
      cy.get("#recipe_description").type("rule");
      cy.get(".btn").contains("Create Recipe").click();
      cy.contains("Ingredients is too short (minimum is 5 characters)");
      cy.contains("Description is too short (minimum is 5 characters)");
      cy.contains("Title is too long (maximum is 40 characters)");
    });

    it("create a recipe and a success message appears ", () => {
      cy.get("#recipe_title").type("Chicken Parmesan");
      cy.get("#recipe_ingredients").type(
        "4 skinless chicken breasts halves, 1/2 cup Parmesan cheese, 1 cup panko bread crumbs, pinch of salt"
      );
      cy.get("#recipe_description").type(
        "Place chicken breasts between two sheets of heavy plastic (resealable freezer bags work well) on a solid, level surface." +
          "Firmly pound chicken with the smooth side of a meat mallet to a thickness of 1/2-inch. Season chicken thoroughly with salt and pepper."
      );
      cy.get(".btn").contains("Create Recipe").click();
      cy.contains("Recipe Created");
      verifyNewRecipe();
      cy.visit("/");
      cy.contains("Chicken Parmesan");
    });
  });

  //UPDATE//
  describe("Update/Show Recipe", () => {
    beforeEach(() => {
      // cy.appScenario("recipe");
      cy.contains("Cheeseburger").get(".fa-edit").click();
    });

    const verifyUpdatedRecipe = () => {
      cy.contains("Bacon Cheeseburger");
      cy.contains(
        "2 pounds ground beef, 1 tablespoon onion powder, 1 teaspoon salt," +
          "1 teaspoon freshly ground black pepper,12 slices American cheese, 6 large burger buns, 3 strips of bacon"
      );
      cy.contains(
        "In a large bowl, mix ground beef, onion powder, salt and pepper until just" +
          "combined. Cook the the bacon in a pan"
      );
      cy.contains("By:Someone");
    };

    it("edit the recipe and check to see if recipe updated", () => {
      cy.get("#recipe_title").clear().type("Bacon Cheeseburger");
      cy.get("#recipe_ingredients")
        .clear()
        .type(
          "2 pounds ground beef, 1 tablespoon onion powder, 1 teaspoon salt," +
            "1 teaspoon freshly ground black pepper,12 slices American cheese, 6 large burger buns, 3 strips of bacon"
        );
      cy.get("#recipe_description")
        .clear()
        .type(
          "In a large bowl, mix ground beef, onion powder, salt and pepper until just" +
            "combined. Cook the the bacon in a pan"
        );
      cy.get(".btn").contains("Update Recipe").click();
      cy.contains("Recipe Updated");
      verifyUpdatedRecipe();
      cy.visit("/");
      cy.get(".fa-search").click();
      verifyUpdatedRecipe();
    });
  });

  describe("Destroy Recipe", () => {
    it("Destroys the the recipe and shows success message", () => {
      cy.get(".fa-trash-alt").click();
      cy.contains("Recipe Deleted");
    });
  });
});
