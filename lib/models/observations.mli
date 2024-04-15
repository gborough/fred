(** Container for observations data *)
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
  {observation_realtime_start: string; [@key "realtime_start"] observation_realtime_end: string; [@key "realtime_end"] date: string; value: string}
[@@deriving of_yojson, show]

(** Observation's units options *)
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

(** Observation's frequency options *)
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

(** Observation's aggregation method options *)
type aggregation_method = Average | Sum | EndOfPeriod

(** Observation's output type method options *)
type output_type =
  | ObservationsByRealTimePeriod
  | ObservationsByVintageDateAllObservations
  | ObservationsByVintageDateNewAndRevisedObservationsOnly
  | ObservationsInitialReleaseOnly

val units_to_string : units -> string

val frequency_to_string : frequency -> string

val aggregation_method_to_string : aggregation_method -> string

val output_type_to_string : output_type -> string
