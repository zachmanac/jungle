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

  it('Navigates to product details page', () => {
    cy.get('.products article')
      .first()
      .click();

    cy.url().should('include', '/products/');
  });
  
})