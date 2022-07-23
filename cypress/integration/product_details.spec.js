describe('Product Page', () => {
  it ('Links to product page from the home page', () => {
    cy.visit('/');
    cy.get('.products article')
      .children()
      .first()
      .get("img")
      .first()
      .click()
    cy.get('.product-detail').should("be.visible")
  })
})
