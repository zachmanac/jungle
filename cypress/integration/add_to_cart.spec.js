describe('Jungle App', () => {
  it('successfully loads', () => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Adds item to cart", () => {
    cy.get(".products article")
    .first()
    .find("button")
    .contains("Add")
    .click({force: true}) //to skip registration check

    cy.get(".nav-item.end-0 .nav-link")
      .should("contain.text", "My Cart (1)"); 
  })
  
})