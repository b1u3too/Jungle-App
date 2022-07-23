describe('Add to Cart Button', () => {
  it ('Increments cart count by 1 when "Add to Cart" button clicked on home page', () => {
    cy.visit('/');
    cy.get('.products article')
      .first()
      .contains('Add')
      .click({ force: true });
    cy.get('.nav-link').should('include.text', 'My Cart (1)')
  })
  it ('Increments cart count by 1 when "Add to Cart" button clicked on product page', () => {
    cy.visit('/products/1');
    cy.get('.product-detail button').click()
    cy.get('.nav-link').should('include.text', 'My Cart (1)')
  })
})
