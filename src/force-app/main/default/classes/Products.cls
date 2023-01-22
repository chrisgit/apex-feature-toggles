public with sharing class Products {
    public static Decimal getPrice(Decimal price) {
        if (FeatureToggles.salesActive == false) {
            return price;
        }
        return applyDiscount(price, 10);
    }

    private static Decimal applyDiscount(Decimal price, Integer discountPercentage) {
        Decimal discountValue = (Decimal) discountPercentage / 100 * price;

        return price - discountValue;
    }
}