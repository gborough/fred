(** Container for maps regional data *)
type maps_regional_data = {meta: Maps_series_data.meta}
[@@deriving of_yojson, show]

(** Maps regional's tranformation options *)
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

(** Maps regional's frequency options *)
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

(** Maps regional's aggregation method options *)
type aggregation_method = Average | Sum | EndOfPeriod

val transformation_to_string : transformation -> string

val frequency_to_string : frequency -> string

val aggregation_method_to_string : aggregation_method -> string
