public class FeatureToggles {
    public static final String SALES_PRICES_ACTIVE = 'WinterSaleActive';
    
    @TestVisible
    private static FeatureToggleProvider provider = new FeatureToggleProvider(); 
        
    public static Boolean salesActive {
        get {
            return provider.getValueOrDefaultToFalse(SALES_PRICES_ACTIVE);
        }
    }
}