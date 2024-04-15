type maps_regional_data = {meta: Maps_series_data.meta}
[@@deriving of_yojson, show]

type transformation =
  | Levels
  | Change
  | ChangeFromYearAgo
  | PercentChange
  | PercentChangeFromYearAgo
  | CompoundedAnnualRateOfChange
  | ContinuouslyCompoundedRateOfChange
  | ContinuouslyCompoundedAnnualRateOfChange
  | NaturalLog

let transformation_to_string = function
  | Levels -> "&unit=lin"
  | Change -> "&unit=chg"
  | ChangeFromYearAgo -> "&unit=ch1"
  | PercentChange -> "&unit=pch"
  | PercentChangeFromYearAgo -> "&unit=pc1"
  | CompoundedAnnualRateOfChange -> "&unit=pca"
  | ContinuouslyCompoundedRateOfChange -> "&unit=cch"
  | ContinuouslyCompoundedAnnualRateOfChange -> "&unit=cca"
  | NaturalLog -> "&unit=log"

type frequency =
  | Default
  | Daily
  | Weekly
  | Biweekly
  | Monthly
  | Quarterly
  | Semiannual
  | Annual
  | WeeklyEndingFriday
  | WeeklyEndingThursday
  | WeeklyEndingWednesday
  | WeeklyEndingTuesday
  | WeeklyEndingMonday
  | WeeklyEndingSunday
  | WeeklyEndingSaturday
  | BiweeklyEndingWednesday
  | BiweeklyEndingMonday

let frequency_to_string = function
  | Default -> ""
  | Daily -> "&frequency=d"
  | Weekly -> "&frequency=w"
  | Biweekly -> "&frequency=bw"
  | Monthly -> "&frequency=m"
  | Quarterly -> "&frequency=q"
  | Semiannual -> "&frequency=sa"
  | Annual -> "&frequency=a"
  | WeeklyEndingFriday -> "&frequency=wef"
  | WeeklyEndingThursday -> "&frequency=weth"
  | WeeklyEndingWednesday -> "&frequency=wew"
  | WeeklyEndingTuesday -> "&frequency=wetu"
  | WeeklyEndingMonday -> "&frequency=wem"
  | WeeklyEndingSunday -> "&frequency=wesu"
  | WeeklyEndingSaturday -> "&frequency=wesa"
  | BiweeklyEndingWednesday -> "&frequency=bwew"
  | BiweeklyEndingMonday -> "&frequency=bwem"

type aggregation_method = Average | Sum | EndOfPeriod

let aggregation_method_to_string = function
  | Average -> "&aggregation_method=avg"
  | Sum -> "&aggregation_method=sum"
  | EndOfPeriod -> "&aggregation_method=eop"
