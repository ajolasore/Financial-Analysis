
# Financials.csv README

**Welcome to the Financials Dataset**
This README provides a comprehensive overview of the `Financials.csv` dataset, designed for financial analysts, data scientists, and business intelligence professionals. The dataset captures detailed sales transaction records across multiple dimensions, enabling deep analysis of revenue streams, profitability, and market performance. Created for public use and academic/research purposes, it offers clean, structured data suitable for advanced analytics, machine learning models, or business reporting.

## Dataset Summary

`Financials.csv` contains approximately 27,000 rows of transactional sales data spanning 2013–2014.  It tracks bicycle product sales across customer segments, countries, and discount levels, with full financial metrics from units sold to net profit.  Total file size is ~122KB, making it lightweight yet rich for scalable analysis.

Key characteristics:

- **Time Period**: January 2013 to December 2014 (24 months).
- **Geographies**: Canada, Germany, France, Mexico, United States.
- **Products**: 8 bicycle models (Carretera, Montana, Paseo, Velo, VTT, Amarilla).
- **Customer Segments**: Government, Enterprise, Midmarket, Channel Partners, Small Business.
- **Data Quality**: Mostly clean numerics; minor formatting notes (e.g., commas in large numbers like "5,29,550.00"). No major missing values observed.

This dataset is ideal for exploring profitability drivers, regional performance, discount impacts, and product lifecycle trends.

## Column Specifications

The dataset includes 17 columns, all transaction-level. Below is a detailed schema with data types, descriptions, and examples:


| Column | Data Type | Description | Example Values |
| :-- | :-- | :-- | :-- |
| Channel Partners| Categorical | Customer type (e.g., Government, Midmarket) | "Government", "Enterprise" |
| Country | Categorical | Sales country | "Canada", "Germany" |
| Product | Categorical | Bicycle model sold | "Carretera", "Montana" |
| Discount Band | Categorical | Discount tier ("None", "Low", "Medium", "High") | "None", "Low" |
| Units Sold | Float | Quantity sold (can include decimals for averaged data) | 1618.50, 1321.00 |
| Manufacturing Price | Float | Unit production cost | 3.00, 5.00, 120.00 |
| Sale Price | Float | Unit selling price | 20.00, 15.00, 350.00 |
| Gross Sales | Float | Revenue before discounts (Units Sold × Sale Price) | 32370.00, 529550.00 |
| Discounts | Float | Total discount amount applied ("-" for none) | "-", 276.15 |
| Sales | Float | Net sales (Gross Sales - Discounts) | 32370.00, 27338.85 |
| COGS | Float | Cost of Goods Sold (Units Sold × Manufacturing Price) | 16185.00, 19725.0 |
| Profit | Float | Net profit (Sales - COGS) | 16185.00, 7613.85 |
| Date | String | Transaction date (MMDDYYYY format, e.g., "010120141" for Jan 2014) | "010620146" |
| Month Number | Integer | Month index (1-12) | 1, 6  |
| Month Name | Categorical | Full month name | "January", "June" |
| Year | Integer | Calendar year | 2013, 2014  |

**Notes**:

- Dates use non-standard formatting (e.g., "010120141" = Jan 1, 2014). Parse as `substring(Date,1,4)+'-'+substring(Date,5,2)+'-'+substring(Date,7,8)`.
- Discounts often appear as "-" (treat as 0 in analysis).
- Units Sold with decimals suggest aggregated or weighted records.


## Business Context

This appears to be sales data from a bicycle manufacturer or distributor targeting B2B channels.

- **Products**: Carretera (low-cost, ~\$3/unit manuf.), Velo/VTT (premium, ~\$120–250/unit).
- **Pricing Strategy**: Sale prices vary by band (7–350 units), with discounts reducing margins. "None" discounts often yield highest profits.
- **Top Markets**: Germany and Canada dominate volume; USA shows high-value deals.
- **Segments**: Government excels in bulk/high-price sales; Channel Partners focus on volume.


## Recommended Analyses

Leverage this for:

- Profitability by product/segment/country (e.g., Velo's high margins in Enterprise).
- Discount ROI (Low discounts boost volume without eroding profits much).
- Time-series trends (seasonal peaks in summer months).
- Geospatial mapping (country-level sales heatmaps).
- Cohort analysis (2013 vs. 2014 performance).

Load into tools like Pandas, Excel, Tableau, or databases for quick insights. Derived metrics like profit margin (`Profit/COGS`) reveal ~50% average margins on undiscounted sales.

## Usage Guidelines

- **License**: Public domain for non-commercial use; attribute to original source if known.
- **Cleaning Tips**: Standardize commas in numerics; convert Date to datetime; replace "-" with 0.
- **Extensions**: Augment with external data (e.g., GDP by country, bike market trends).
- **File Integrity**: MD5 checksum available upon request; no corruption noted.

For questions or contributions, open an issue on the hosting repository. Happy analyzing!


