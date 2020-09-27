// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "./stylesheets/tailwind"

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import MicroModal from 'micromodal';

document.addEventListener('readystatechange', function(event) {
  if (document.readyState === "complete") {

    (function () {
      const markAsCompleteElements = document.querySelectorAll('.mark-as-complete')

      const completionForm = document.querySelector('.completion-form')
      const listItemId = document.querySelector('.completion-form [name=\'list_item[id]\']')
      const listItemProductPrice = document.querySelector('.completion-form [name=\'list_item[product_price]\']')
      const listItemAmount = document.querySelector('.completion-form [name=\'list_item[amount]\']')
      
      const submitForm = e => {
        e.preventDefault()
        fetch(`/api/v1/list_items/${listItemId.value}/complete`, {
          body: JSON.stringify({
            list_item: {
              product_price: listItemProductPrice.value,
              final_amount: listItemAmount.value
            }
          }),
          method: 'POST',
          headers: {
            "Content-Type": "application/json"
          }
        }).then(() => {
          MicroModal.close('modal-complete-item');
          const listItemCard = document.querySelector(`.list-item[data-id='${listItemId.value}']`)
          listItemCard.parentNode.removeChild(listItemCard)
        })
      }

      const openMarkAsCompletedModal = element => e => {
        e.preventDefault()
        listItemId.value = element.dataset.listItemId
        listItemAmount.value = element.dataset.listItemAmount
        listItemProductPrice.value = parseFloat(element.dataset.listItemLastProductPrice)
        MicroModal.show('modal-complete-item');
      }
      
      markAsCompleteElements.forEach(element => element.addEventListener('click', openMarkAsCompletedModal(element)))
      completionForm.addEventListener('submit', submitForm)
    })()
  }
});