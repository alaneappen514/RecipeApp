describe("User Login", () => {
  beforeEach(() => {
    cy.visit("/");
    cy.get(".btn").contains("Login").click();
  });

  it("Should fail the login when entering the wrong credentials", () => {
    cy.url().should("include", "/sign_in");
    cy.contains("Email").type("some@gmail.com");
    cy.contains("Password").type("!password!");
    cy.get(".btn").contains("Log in").click();
    cy.contains("Invalid Email or password.");
  });

  it("Test the navigation on Login Page", () => {
    cy.get(".btn").contains("Sign up").click();
    cy.get("h2").contains("Sign up");
    cy.get(".btn").contains("Log in").click();
    cy.get(".btn").contains("Forgot your password?").click();
    cy.get(".btn").contains("Send me reset password instructions");
    cy.get(".btn").contains("Log in").click();
    cy.get(".navbar-brand").click();
    cy.contains("Recipe Treasures");
    cy.get(".btn").contains("Login").click();
  });

  it("The user logins in successfully and shows success message", () => {
    cy.contains("Email").type("someone@gmail.com");
    cy.contains("Password").type("!password!");
    cy.get(".btn").contains("Log in").click();
    cy.contains("Signed in successfully.");
  });
});
