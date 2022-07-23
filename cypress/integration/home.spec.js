describe('Home Page', () => {
  it ('Loads the home page', () => {
    cy.visit('/');
    cy.get(".container").should("be.visible");
  })
  it('There are 2 products on the home page', () => {
    cy.get(".products article").should("be.visible");
    cy.get(".products article").should("have.length", 2);
  })

})
