enum Stu3Types {
  account,
  activitydefinition,
  adverseevent,
  allergyintolerance,
  appointment,
  appointmentresponse,
  auditevent,
  basic,
  binary,
  bodysite,
  bundle,
  capabilitystatement,
  careplan,
  careteam,
  chargeitem,
  claim,
  claimresponse,
  clinicalimpression,
  codesystem,
  communication,
  communicationrequest,
  compartmentdefinition,
  composition,
  conceptmap,
  condition,
  consent,
  contract,
  coverage,
  dataelement,
  detectedissue,
  device,
  devicecomponent,
  devicemetric,
  devicerequest,
  deviceusestatement,
  diagnosticreport,
  documentmanifest,
  documentreference,
  eligibilityrequest,
  eligibilityresponse,
  encounter,
  endpoint,
  enrollmentrequest,
  enrollmentresponse,
  episodeofcare,
  expansionprofile,
  explanationofbenefit,
  familymemberhistory,
  flag,
  goal,
  graphdefinition,
  group,
  guidanceresponse,
  healthcareservice,
  imagingmanifest,
  imagingstudy,
  immunization,
  immunizationrecommendation,
  implementationguide,
  library,
  linkage,
  list,
  location,
  measure,
  measurereport,
  media,
  medication,
  medicationadministration,
  medicationdispense,
  medicationrequest,
  medicationstatement,
  messagedefinition,
  messageheader,
  namingsystem,
  nutritionorder,
  observation,
  operationdefinition,
  operationoutcome,
  organization,
  parameters,
  patient,
  paymentnotice,
  paymentreconciliation,
  person,
  plandefinition,
  practitioner,
  practitionerrole,
  procedure,
  procedurerequest,
  processrequest,
  processresponse,
  provenance,
  questionnaire,
  questionnaireresponse,
  referralrequest,
  relatedperson,
  requestgroup,
  researchstudy,
  researchsubject,
  riskassessment,
  schedule,
  searchparameter,
  sequence,
  servicedefinition,
  slot,
  specimen,
  structuredefinition,
  structuremap,
  subscription,
  substance,
  supplydelivery,
  supplyrequest,
  task,
  testreport,
  testscript,
  valueset,
  visionprescription,
  none,
  any,
}

const Stu3TypesEnumMap = {
  Stu3Types.account: 'Account',
  Stu3Types.activitydefinition: 'ActivityDefinition',
  Stu3Types.adverseevent: 'AdverseEvent',
  Stu3Types.allergyintolerance: 'AllergyIntolerance',
  Stu3Types.appointment: 'Appointment',
  Stu3Types.appointmentresponse: 'AppointmentResponse',
  Stu3Types.auditevent: 'AuditEvent',
  Stu3Types.basic: 'Basic',
  Stu3Types.binary: 'Binary',
  Stu3Types.bodysite: 'BodySite',
  Stu3Types.bundle: 'Bundle',
  Stu3Types.capabilitystatement: 'CapabilityStatement',
  Stu3Types.careplan: 'CarePlan',
  Stu3Types.careteam: 'CareTeam',
  Stu3Types.chargeitem: 'ChargeItem',
  Stu3Types.claim: 'Claim',
  Stu3Types.claimresponse: 'ClaimResponse',
  Stu3Types.clinicalimpression: 'ClinicalImpression',
  Stu3Types.codesystem: 'CodeSystem',
  Stu3Types.communication: 'Communication',
  Stu3Types.communicationrequest: 'CommunicationRequest',
  Stu3Types.compartmentdefinition: 'CompartmentDefinition',
  Stu3Types.composition: 'Composition',
  Stu3Types.conceptmap: 'ConceptMap',
  Stu3Types.condition: 'Condition',
  Stu3Types.consent: 'Consent',
  Stu3Types.contract: 'Contract',
  Stu3Types.coverage: 'Coverage',
  Stu3Types.dataelement: 'DataElement',
  Stu3Types.detectedissue: 'DetectedIssue',
  Stu3Types.device: 'Device',
  Stu3Types.devicecomponent: 'DeviceComponent',
  Stu3Types.devicemetric: 'DeviceMetric',
  Stu3Types.devicerequest: 'DeviceRequest',
  Stu3Types.deviceusestatement: 'DeviceUseStatement',
  Stu3Types.diagnosticreport: 'DiagnosticReport',
  Stu3Types.documentmanifest: 'DocumentManifest',
  Stu3Types.documentreference: 'DocumentReference',
  Stu3Types.eligibilityrequest: 'EligibilityRequest',
  Stu3Types.eligibilityresponse: 'EligibilityResponse',
  Stu3Types.encounter: 'Encounter',
  Stu3Types.endpoint: 'Endpoint',
  Stu3Types.enrollmentrequest: 'EnrollmentRequest',
  Stu3Types.enrollmentresponse: 'EnrollmentResponse',
  Stu3Types.episodeofcare: 'EpisodeOfCare',
  Stu3Types.expansionprofile: 'ExpansionProfile',
  Stu3Types.explanationofbenefit: 'ExplanationOfBenefit',
  Stu3Types.familymemberhistory: 'FamilyMemberHistory',
  Stu3Types.flag: 'Flag',
  Stu3Types.goal: 'Goal',
  Stu3Types.graphdefinition: 'GraphDefinition',
  Stu3Types.group: 'Group',
  Stu3Types.guidanceresponse: 'GuidanceResponse',
  Stu3Types.healthcareservice: 'HealthcareService',
  Stu3Types.imagingmanifest: 'ImagingManifest',
  Stu3Types.imagingstudy: 'ImagingStudy',
  Stu3Types.immunization: 'Immunization',
  Stu3Types.immunizationrecommendation: 'ImmunizationRecommendation',
  Stu3Types.implementationguide: 'ImplementationGuide',
  Stu3Types.library: 'Library',
  Stu3Types.linkage: 'Linkage',
  Stu3Types.list: 'List',
  Stu3Types.location: 'Location',
  Stu3Types.measure: 'Measure',
  Stu3Types.measurereport: 'MeasureReport',
  Stu3Types.media: 'Media',
  Stu3Types.medication: 'Medication',
  Stu3Types.medicationadministration: 'MedicationAdministration',
  Stu3Types.medicationdispense: 'MedicationDispense',
  Stu3Types.medicationrequest: 'MedicationRequest',
  Stu3Types.medicationstatement: 'MedicationStatement',
  Stu3Types.messagedefinition: 'MessageDefinition',
  Stu3Types.messageheader: 'MessageHeader',
  Stu3Types.namingsystem: 'NamingSystem',
  Stu3Types.nutritionorder: 'NutritionOrder',
  Stu3Types.observation: 'Observation',
  Stu3Types.operationdefinition: 'OperationDefinition',
  Stu3Types.operationoutcome: 'OperationOutcome',
  Stu3Types.organization: 'Organization',
  Stu3Types.parameters: 'Parameters',
  Stu3Types.patient: 'Patient',
  Stu3Types.paymentnotice: 'PaymentNotice',
  Stu3Types.paymentreconciliation: 'PaymentReconciliation',
  Stu3Types.person: 'Person',
  Stu3Types.plandefinition: 'PlanDefinition',
  Stu3Types.practitioner: 'Practitioner',
  Stu3Types.practitionerrole: 'PractitionerRole',
  Stu3Types.procedure: 'Procedure',
  Stu3Types.procedurerequest: 'ProcedureRequest',
  Stu3Types.processrequest: 'ProcessRequest',
  Stu3Types.processresponse: 'ProcessResponse',
  Stu3Types.provenance: 'Provenance',
  Stu3Types.questionnaire: 'Questionnaire',
  Stu3Types.questionnaireresponse: 'QuestionnaireResponse',
  Stu3Types.referralrequest: 'ReferralRequest',
  Stu3Types.relatedperson: 'RelatedPerson',
  Stu3Types.requestgroup: 'RequestGroup',
  Stu3Types.researchstudy: 'ResearchStudy',
  Stu3Types.researchsubject: 'ResearchSubject',
  Stu3Types.riskassessment: 'RiskAssessment',
  Stu3Types.schedule: 'Schedule',
  Stu3Types.searchparameter: 'SearchParameter',
  Stu3Types.sequence: 'Sequence',
  Stu3Types.servicedefinition: 'ServiceDefinition',
  Stu3Types.slot: 'Slot',
  Stu3Types.specimen: 'Specimen',
  Stu3Types.structuredefinition: 'StructureDefinition',
  Stu3Types.structuremap: 'StructureMap',
  Stu3Types.subscription: 'Subscription',
  Stu3Types.substance: 'Substance',
  Stu3Types.supplydelivery: 'SupplyDelivery',
  Stu3Types.supplyrequest: 'SupplyRequest',
  Stu3Types.task: 'Task',
  Stu3Types.testreport: 'TestReport',
  Stu3Types.testscript: 'TestScript',
  Stu3Types.valueset: 'ValueSet',
  Stu3Types.visionprescription: 'VisionPrescription',
  Stu3Types.none: '',
  Stu3Types.any: '*',
};