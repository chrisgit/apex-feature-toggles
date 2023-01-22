@IsTest
public class ProductsTest {
    @IsTest
    public static void given_ThereAreNoSales_When_PriceCheck_Then_FullPrice() {
		FeatureToggles.provider = new MockFeatureToggleProvider()
            .setToggleFor(FeatureToggles.SALES_PRICES_ACTIVE, false);

        System.assertEquals(100, Products.getPrice(100), 'Product not returning full price');
    }

    @IsTest
    public static void given_WinterSaleInOn_When_PriceCheck_Then_IncludesDiscount() {
		FeatureToggles.provider = new MockFeatureToggleProvider()
            .setToggleFor(FeatureToggles.SALES_PRICES_ACTIVE, true);

            System.assertEquals(90, Products.getPrice(100), 'Product not returning discounted price');
        }
}