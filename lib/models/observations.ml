type observations =
  { realtime_start: string
  ; realtime_end: string
  ; observation_start: string
  ; observation_end: string
  ; units: string
  ; output_type: int
  ; file_type: string
  ; order_by: string
  ; sort_order: string
  ; count: int
  ; offset: int
  ; limit: int
  ; observations: observation list }
[@@deriving of_yojson, show]

and observation =
  {observation_realtime_start: string [@key "realtime_start"]; observation_realtime_end: string [@key "realtime_end"]; date: string; value: string}
[@@deriving of_yojson, show]

type units =
  | Levels
  | Change
  | ChangeFromYearAgo
  | PercentChange
  | PercentChangeFromYearAgo
  | CompoundedAnnualRateOfChange
  | ContinuouslyCompoundedRateOfChange
  | ContinuouslyCompoundedAnnualRateOfChange
  | NaturalLog

let units_to_string = function
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

type output_type =
  | ObservationsByRealTimePeriod
  | ObservationsByVintageDateAllObservations
  | ObservationsByVintageDateNewAndRevisedObservationsOnly
  | ObservationsInitialReleaseOnly

let output_type_to_string = function
  | ObservationsByRealTimePeriod -> "&output_type=1"
  | ObservationsByVintageDateAllObservations -> "&output_type=2"
  | ObservationsByVintageDateNewAndRevisedObservationsOnly ->
      "&output_type=3"
  | ObservationsInitialReleaseOnly -> "&output_type=4"
