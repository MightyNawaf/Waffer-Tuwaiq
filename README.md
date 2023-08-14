# waffer

A new Flutter project.

## Changes made by Mjd Using Odometer package
**All changes made on "budget_card.dart" file, located in components folder**
- Remove Text widget that show the balnce in card, and use "AnimatedSlideOdmeter" instead
- Using round() method to make it an integer number
- Change "shimmered" effect position by putting it at the end of the row

## Secreen recording
  - Income example<br>
  <br>![income](https://github.com/Mjd-Gh/Waffer-Tuwaiq/assets/101333803/2fe2ade8-3615-4ed2-86e4-609f77d2f308)
  - Outcome case<br>
  <br>![outcome](https://github.com/Mjd-Gh/Waffer-Tuwaiq/assets/101333803/347c2f4a-4ae8-4047-b596-3ea0ac4c50dc)

## Problem with using Odmeter package
- Odometer doesn't accept double number "only integers", that why I use rounding method
- When the number of digits increased, then decreased the extra digits will not removed, to make it clear see the showcase below
  - Extra digit problem<br>
  <br>![proble case](https://github.com/Mjd-Gh/Waffer-Tuwaiq/assets/101333803/48f95bcf-acf1-473f-b3d6-21804b1718c9)

