import React from 'react';
import { Link, withRouter } from 'react-router';


const BoughtTogether = (props) => {
  if (props.product.bought_together.length > 0) {
    return (
      <div>
        <h3>Frequently bought together</h3>
        <ul className="bought-together-list">
          {props.product.bought_together.map((product, i) => {
            return (
              <li key={i} className="single-product-block">
                <div>
                  <Link to={`/categories/${product.category_id}/products/${product.id}`}>
                    <img width="150" height="150" src={product.product_pictures[0].image_url} />
                  </Link>
                </div>
              </li>
            )
          })}
        </ul>
      </div>
    )
  } else {
    return null;
  }
}


export default withRouter(BoughtTogether);