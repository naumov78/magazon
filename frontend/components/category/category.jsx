import React from 'react';
import { withRouter, Link } from 'react-router';
import StorefrontContainer from '../storefront/storefront/storefront_container';
import WatchedProductsContainer from '../storefront/watched_products/watched_products_container';


class Category extends React.Component {

  constructor(props) {
  super(props);
  this.state = { products: null }
  }


  componentWillReceiveProps(nextProps) {
    let id = nextProps.params.id
    if (id !== this.props.params.id) {
      this.props.fetchCategory(id).then((result) => {
        this.setState({ products: result.products })
    });
    }
  }

  updateDescrLength(str) {
    if (str && str.length > 200) {
      return str.slice(0, 197) + "..."
    }
    return str;
  }

  componentDidMount() {
    this.props.fetchCategory(this.props.params.id).then((result) => {
      this.setState({ products: result.products })
    })
  }

  addToCart(id, quantity) {
    this.props.addToCart(id, quantity)
  }

  getProductsList() {
    const products = this.state.products
    return (
      <ul className="category-list">
        {products.map((product, i) => {
          return (
            <li key={i} className="product-line">
                <div className="product-picture">
                  <Link to={`/categories/${product.category_id}/products/${product.id}`} >
                    <span id="image"><img src={product.product_pictures[0].image_url} /></span>
                  </Link>
                </div>

                <div className="category-product-info">
                  <Link to={`/categories/${product.category_id}/products/${product.id}`} >
                    <span className="product-title">{product.title}</span>
                  </Link>

                  <div className="product-price">
                    Price:
                    <span className="price">${Number(product.price).toFixed(2)}</span>
                  </div>
                  <div className="product-descr">
                    {this.updateDescrLength(product.brief_description)}
                  </div>
                  <div className="addToCart-button">
                    <button onClick={() => this.addToCart(product.id, 1)}>Add to cart</button>
                  </div>
                </div>

            </li>
          );
        })}
      </ul>
    )
  }

  render() {
    if (this.state.products) {
    return (
      <div className="category-container">

        <div className="central-block">
            <StorefrontContainer />
            {this.getProductsList()}
            <StorefrontContainer />
        </div>

        <div>
          <WatchedProductsContainer />
        </div>

      </div>
    );
    } else {
      return null;
    }
  }

}

export default withRouter(Category);


//
// <div></div> // <StorefrontContainer /> dir: column
// </div> // central block, dir: row
//
// <div></div> // <WatchedProductsContainer />
