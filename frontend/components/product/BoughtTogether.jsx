import React from 'react';
import { Link, withRouter } from 'react-router';


function getContent(props) {
  return (
    <div className="bought-together-container">
      <p>Frequently bought together</p>
      <ul className="bought-together-list">
        {props.product.bought_together.slice(0,10).map((product, i) => {
          return (
            <li key={i} className="single-product-block">
              <div className="bought-together">
                <div className="bt-product">
                  <Link to={`/categories/${product.category_id}/products/${product.id}`}>
                    <img src={product.product_pictures[0].image_url} />
                    <span>{product.title}</span>
                  </Link>
                </div>
                <div>
                    <span className="bought-together-price">${Number(product.price).toFixed(2)}</span>
                </div>
              </div>
            </li>
          );
        })}
      </ul>
    </div>
  );
}

const BoughtTogether = (props) => {
  return props.product.bought_together.length ? getContent(props) : null;
}


export default withRouter(BoughtTogether);
