*** Settings ***
Library  Selenium2Screenshots
Library  Selenium2Library
Library  String
Library  DateTime
Library  etender_service.py

*** Variables ***
${locator.tenderId}                                            xpath=//*[@id='tenderidua']/b
${locator.title}                                               id=tenderTitle
${locator.status}                                              id=tenderStatus
${locator.description}                                         id=tenderDescription
${locator.minimalStep.amount}                                  id=lotMinimalStep_0
${locator.procuringEntity.name}                                id=tenderOwner
${locator.procuringEntity.address.countryName}                 id=customer_country
${locator.procuringEntity.address.locality}                    id=customer_city
${locator.procuringEntity.address.postalCode}                  id=customer_postIndex
${locator.procuringEntity.address.region}                      id=customer_region
${locator.procuringEntity.address.streetAddress}               id=customer_addressStr
${locator.procuringEntity.contactPoint.name}                   xpath=//span[contains(@ng-bind,"customer.organization.contactPoint.name") and not(contains(@ng-bind,"nameEN"))]
${locator.procuringEntity.contactPoint.telephone}              xpath=//span[contains(@ng-bind,"customer.organization.contactPoint.telephone")]
${locator.procuringEntity.contactPoint.url}                    xpath=//div[@class = 'row']/div/span[text() = 'Сайт:']/parent::div/following-sibling::div/a
${locator.procuringEntity.identifier.legalName}                xpath=//span[contains(@ng-bind,"customer.organization.name")]
${locator.procuringEntity.identifier.scheme}                   xpath=//div[@class = 'row']/div/span[text() = 'Найменування:']/parent::div/parent::div/following-sibling::div/div/span[starts-with(.,'Код')]
${locator.procuringEntity.identifier.id}                       xpath=//span[contains(@ng-bind,"customer.organization.identifier.apiId")]
${locator.value.amount}                                        id=tenderBudget
${locator.tenderPeriod.startDate}                              id=tenderStart
${locator.tenderPeriod.endDate}                                id=tenderEnd
${locator.enquiryPeriod.startDate}                             id=enquiryStart
${locator.enquiryPeriod.endDate}                               id=enquiryEnd
${locator.causeDescription}                                    id=causeDescription
${locator.cause}                                               id=cause
${locator.qualificationPeriod.endDate}                         id=qualificationPeriod_endDate
${locator.contracts[0].status}                                 xpath=//div[@class = 'row']/div[contains(.,'Статус договору:')]/following-sibling::div
${locator.items[0].description}                                id=item_description_00
${locator.items[0].deliveryDate.startDate}                     id=delivery_start_00
${locator.items[0].deliveryDate.endDate}                       id=delivery_end_00
${locator.items[0].deliveryLocation.latitude}                  id=delivery_latitude0
${locator.items[0].deliveryLocation.longitude}                 id=delivery_longitude0
${locator.items[0].deliveryAddress.postalCode}                 id=delivery_postIndex_00
${locator.items[0].deliveryAddress.countryName}                id=delivery_country_00
${locator.items[0].deliveryAddress.region}                     id=delivery_region_00
${locator.items[0].deliveryAddress.locality}                   id=delivery_city_00
${locator.items[0].deliveryAddress.streetAddress}              id=delivery_addressStr_00
${locator.items[0].classification.scheme}                      xpath=//table[contains(@class,"itemTable")]//th[contains(.,"Класифікатор ")]
${locator.items[0].classification.id}                          id=classification_code_00
${locator.items[0].classification.description}                 id=classification_name_00
${locator.items[0].additionalClassifications[0].scheme}        xpath=//div[6]/div[3]/div/p
${locator.items[0].additionalClassifications[0].id}            id=additionalClassification_id0
${locator.items[0].additionalClassifications[0].description}   id=additionalClassification_desc0
${locator.items[0].unit.code}                                  id=item_unit_00
${locator.items[0].quantity}                                   id=item_quantity_00
${locator.items[0].unit.name}                                  id=item_unit_00
${locator.questions[0].title}                                  id=quest_title_0
${locator.questions[0].description}                            id=quest_descr_0
${locator.questions[0].date}                                   id=quest_date_0
${locator.questions[0].answer}                                 id=question_answer_0
${locator.awards[0].complaintPeriod.endDate}                   xpath=//div[@ng-if="award.complaintPeriod.endDate"]/div[2]/span
${locator.awards[0].status}                                    xpath=//div[@class = 'row']/div[contains(.,'Статус:')]/following-sibling::div
${locator.awards[0].value.valueAddedTaxIncluded}               xpath=//div[@class = 'row']/div[contains(.,'Пропозиція:')]/following-sibling::div/span/i
${locator.awards[0].value.currency}                            xpath=//div[@class = 'row']/div[contains(.,'Пропозиція:')]/following-sibling::div/span
${locator.awards[0].value.amount}                              xpath=//div[@class = 'row']/div[contains(.,'Пропозиція:')]/following-sibling::div/span
${locator.awards[0].suppliers[0].address.countryName}          id=awardCountry_0
${locator.awards[0].suppliers[0].address.locality}             id=awardCity_0
${locator.awards[0].suppliers[0].address.postalCode}           id=awardIndex_0
${locator.awards[0].suppliers[0].address.region}               id=awardRegion_0
${locator.awards[0].suppliers[0].address.streetAddress}        id=awardAddressStr_0
${locator.awards[0].suppliers[0].name}                         xpath=//span[@id="awardContactPoint"]/u
${locator.awards[0].suppliers[0].contactPoint.telephone}       xpath=//span[@id="awardContactPoint"]/following-sibling::div//p[contains(.,"Телефон:")]
${locator.awards[0].suppliers[0].contactPoint.name}            xpath=//span[@id="awardContactPoint"]/following-sibling::div//p[contains(.,"Контактна особа:")]
${locator.awards[0].suppliers[0].contactPoint.email}           xpath=//span[@id="awardContactPoint"]/following-sibling::div//p[contains(.,"email:")]
${locator.awards[0].suppliers[0].identifier.scheme}            xpath=//span[@id="awardContactPoint"]/following-sibling::div//p/b[contains(.,"Код ")]
${locator.awards[0].suppliers[0].identifier.legalName}         xpath=//span[@id="awardContactPoint"]/u
${locator.awards[0].suppliers[0].identifier.id}                xpath=//span[@id="awardContactPoint"]/following-sibling::div//p[contains(.,"Код ")]
${locator_document_title}                                      xpath=//td[contains(@class,"doc-name")]//a[contains(.,"XX_doc_id_XX")]
${locator_document_href}                                       xpath=//td[contains(@class,"doc-name")]//a[contains(.,"XX_doc_id_XX")]@href
${locator_document_description}                                xpath=//td[contains(@class,"doc-name")]//a[contains(.,"XX_doc_id_XX")]/following-sibling::p
${locator_lot_title}                                           xpath=//div[@id="treeLot0"]//*[@id="lotTitle_0"]
${locator_lot_description}                                     xpath=//div[@id="treeLot0"]//*[@id="lotDescription_0"]
${locator_lot_value.currency}                                  id=lotCurrency_0
${locator_lot_value.amount}                                    id=lotValue_0
${locator_lot_value.valueAddedTaxIncluded}                     xpath=//tender-subject-info//*[@id="lotVatInc_0"]
${locator_lot_minimalStep.amount}                              xpath=//div[@id="treeLot0"]//*[@id="lotMinimalStep_0"]
${locator_lot_minimalStep.currency}                            xpath=//div[@id="treeLot0"]//*[@id="lotMinimalStep_0"]
${locator_lot_minimalStep.valueAddedTaxIncluded}               xpath=//tender-subject-info//*[@id="lotVatInc_0"]
${locator.value.currency}                                      id=tenderCurrency
${locator.value.valueAddedTaxIncluded}                         id=includeVat
${locator.bids}                                                id=ParticipiantInfo_0
${locator_block_overlay}                                       xpath=//div[@class='blockUI blockOverlay']
${locator_question_title}                                      xpath=//span[contains(@id,'quest_title_') and contains(text(),'XX_que_id_XX')]
${locator_feature_title}                                       xpath=//*[contains(@ng-bind,'eature.title') and contains(text(),'XX_feature_id_XX')]
${locator_feature_description}                                 xpath=//*[contains(@ng-bind,'eature.title') and contains(text(),'XX_feature_id_XX')]/../../following-sibling::div//*[contains(@ng-bind,'eature.description')]
${locator_feature_featureOf}                                   xpath=//div[contains(@ng-repeat,"eature")]//span[contains(@ng-bind,"eature.title") and contains(.,"XX_feature_id_XX")]
${locator_item_description}                                    xpath=//p[contains(.,"XX_item_id_XX")]
${locator_item_classification.scheme}                          xpath=//table[contains(@class,"itemTable")]//th[contains(.,"Класифікатор ")]
${locator_item_classification.id}                              xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"classification_code_")]
${locator_item_classification.description}                     xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"classification_name_")]
${locator_item_additionalClassifications[0].id}                xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"additionalClassification_id")]
${locator_item_additionalClassifications[0].description}       xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"additionalClassification_desc")]
${locator_item_quantity}                                       xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"item_quantity_")]
${locator_item_unit.name}                                      xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"item_unit_")]
${locator_item_unit.code}                                      xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"item_unit_")]
${locator_item_deliveryDate.endDate}                           xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"delivery_end_")]
${locator_item_deliveryAddress.countryName}                    xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"delivery_country_")]
${locator_item_deliveryAddress.postalCode}                     xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"delivery_postIndex_")]
${locator_item_deliveryAddress.region}                         xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"delivery_region_")]
${locator_item_deliveryAddress.locality}                       xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"delivery_city_")]
${locator_item_deliveryAddress.streetAddress}                  xpath=//p[contains(.,"XX_item_id_XX")]/../../parent::tr//*[starts-with(@id,"delivery_addressStr_")]
${huge_timeout_for_visibility}                                 300
${locator.search_tender}                                       xpath=//input[@type='text' and @placeholder='Пошук за номером закупівлі']


*** Keywords ***
Підготувати клієнт для користувача
  [Arguments]  @{ARGUMENTS}
  [Documentation]  Відкрити браузер, створити об’єкт api wrapper, тощо
  Open Browser  ${USERS.users['${ARGUMENTS[0]}'].homepage}  ${USERS.users['${ARGUMENTS[0]}'].browser}  alias=${ARGUMENTS[0]}
  Set Window Size  @{USERS.users['${ARGUMENTS[0]}'].size}
  Set Window Position  @{USERS.users['${ARGUMENTS[0]}'].position}
  Run Keyword If  '${ARGUMENTS[0]}' != 'Etender_Viewer'  Login  ${ARGUMENTS[0]}


Підготувати дані для оголошення тендера
  [Arguments]  ${username}  ${tender_data}  ${username_2}
  ${tender_data}=  change_data  ${tender_data}
  Log  ${tender_data}
  Log  ${username}
  Log  ${username_2}
  [return]  ${tender_data}


Login
  [Arguments]  @{ARGUMENTS}
  Wait Until Page Contains Element   css=a.login    180
  Click Link    css=a.login
  Wait Until Page Contains Element   id=inputUsername   180
  Input text   id=inputUsername      ${USERS.users['${ARGUMENTS[0]}'].login}
  Wait Until Page Contains Element   id=inputPassword   180
  Input text   id=inputPassword      ${USERS.users['${ARGUMENTS[0]}'].password}
  Click Button   id=btn_submit
  Go To  ${USERS.users['${ARGUMENTS[0]}'].homepage}

Створити тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_data
  ${items}=             Get From Dictionary     ${ARGUMENTS[1].data}               items
  ${title}=             Get From Dictionary     ${ARGUMENTS[1].data}               title
  ${title_en}=             Get From Dictionary     ${ARGUMENTS[1].data}               title_en
  ${description}=       Get From Dictionary     ${ARGUMENTS[1].data}               description
  ${budget}=            Get From Dictionary     ${ARGUMENTS[1].data.value}         amount
  ${budgetToStr}=       float_to_string_2f      ${budget}      # at least 2 fractional point precision, avoid rounding

  ${methodType}=         Set Variable  ${EMPTY}
  ${status}  ${methodType}=  Run Keyword And Ignore Error  Get From Dictionary  ${ARGUMENTS[1].data}  procurementMethodType
  log to console  check presence of procurementMethodType in dictionary: ${status}
  ${methodType}=  Run Keyword IF  '${status}' != 'PASS'  Set Variable  belowThreshold
  ...             ELSE  Set Variable  ${methodType}
  Set To Dictionary  ${USERS.users['${ARGUMENTS[0]}']}  method_type=${methodType}

  ${search_tab}=  Run Keyword IF  '${methodType}' != 'negotiation'  Set Variable  КОНКУРЕНТНІ ПРОЦЕДУРИ
  ...             ELSE  Set Variable  НЕКОНКУРЕНТНІ ПРОЦЕДУРИ
  Set To Dictionary  ${USERS.users['${ARGUMENTS[0]}']}  HELPER_SEARCH_TAB=${search_tab}

  Selenium2Library.Switch Browser    ${ARGUMENTS[0]}
  Sleep  15
  Click Element                     id=qa_myTenders  # Мої закупівлі
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Wait Until Element Is Visible     xpath=//a[@data-target='#procedureType']  # Створити оголошення
  Sleep  10
  Click Element                     xpath=//a[@data-target='#procedureType']  # Створити оголошення
  Sleep  3

  &{procedure_types}=  Create Dictionary  aboveThresholdUA=Відкриті торги  belowThreshold=Допорогові закупівлі  negotiation=Переговорна процедура  aboveThresholdEU=Відкриті торги з публікацією англійською мовою
  ${lots}=         Set Variable  ${EMPTY}
  ${lots_count}=   Set Variable  ${EMPTY}
  ${status}  ${lots}=  Run Keyword And Ignore Error  Get From Dictionary  ${ARGUMENTS[1].data}  lots
  log to console  presence of lots: ${status}
  ${lots_count}=  Run Keyword IF  '${status}' != 'PASS'  Set Variable  0
  ...             ELSE  Get Length  ${lots}

  Select From List By Label         id=chooseProcedureType  &{procedure_types}[${methodType}]
  Sleep  3
  Click Element                     id=goToCreate  # Продовжити
  Sleep   3

  Додати лот при наявності і внести значення  ${lots_count}  ${lots}
  Input text    id=title                  ${title}
  Run Keyword If    '${methodType}' == 'aboveThresholdEU'   Input text    id=titleEN    ${title_en}
  Input text    id=description            ${description}
  Додати причину з описом при наявності  ${ARGUMENTS[1].data}
  ${features}=        Set Variable  ${EMPTY}
  ${features_count}=  Set Variable  ${EMPTY}
  ${status}  ${features}=  Run Keyword And Ignore Error  Get From Dictionary  ${ARGUMENTS[1].data}  features
  log to console  presence of features: ${status}
  ${features_count}=  Run Keyword IF  '${status}' != 'PASS'  Set Variable  0
  ...                 ELSE  Get Length  ${features}
  Додати нецінові показники при наявності  ${features_count}  ${features}
  Додати enquiry_end_date_time при наявності  ${ARGUMENTS[1]}
  Додати start_date_time при наявності        ${ARGUMENTS[1]}  ${methodType}
  Додати end_date_time при наявності          ${ARGUMENTS[1]}
  Input text    id=lotValue_0        ${budgetToStr}
  Sleep   1
  scrollIntoView by script using xpath  //input[@id="valueAddedTaxIncluded"]  # checkbox ПДВ
  sleep   2
  Click Element    xpath=//input[@id="valueAddedTaxIncluded"]  # checkbox ПДВ
  Додати мінімальний крок при наявності  ${ARGUMENTS[1].data}
  Sleep   1
  Додати предмети  ${methodType}  ${items}
  Sleep  1
  scrollIntoView by script using xpath  //*[@id="createTender"]  # scroll to createTender button
  sleep   2
  Wait Until Page Contains Element   id=createTender
  Click Element   id=createTender
  Sleep   60
  Reload Page
  Wait Until Keyword Succeeds        10 min  20 x  Дочекатися завершення обробки тендера
  ${tender_UAid}=  Get Text  ${locator.tenderId}
  Sleep  1
  Log   ${tender_UAid}
  ${Ids}=   Convert To String   ${tender_UAid}
  log to console      ${Ids}
  Log   ${Ids}
  Run keyword if   '${mode}' == 'multi'   Set Multi Ids   ${ARGUMENTS[0]}   ${tender_UAid}
  [return]  ${Ids}

Додати лот при наявності і внести значення
  [Arguments]  ${lots_count}  ${lots}
  Return From Keyword If  '${lots_count}' == '0'
  ${title}=        Get From Dictionary  ${lots[0]}  title
  ${description}=  Get From Dictionary  ${lots[0]}  description
  Click Element  id=isMultilots  # checkbox Мультилотова закупівля
  Sleep  2
  Input text     id=lotTitle_0  ${title}
  Sleep  1
  Input text     id=lotDescription_0  ${description}
  Sleep  1

Додати нецінові показники при наявності
  [Arguments]  ${features_count}  ${features}
  Return From Keyword If  '${features_count}' == '0'
  :FOR  ${i}  IN RANGE  ${features_count}
  \     ${feature_of}=  Get From Dictionary  ${features[${i}]}  featureOf
  \     Run Keyword If  '${feature_of}' == 'lot'       add feature lot     ${features[${i}]}  0
  \     Run Keyword If  '${feature_of}' == 'tenderer'  add feature tender  ${features[${i}]}  0
  \     Run Keyword If  '${feature_of}' == 'item'      add feature item    ${features[${i}]}  0

Додати мінімальний крок при наявності
  [Arguments]  ${data}
  ${status}  ${step_rate}=  Run Keyword And Ignore Error  Get From Dictionary  ${data.minimalStep}  amount
  log to console  check presence of minimalStep.amount in dictionary: ${status}
  Return From Keyword If  '${status}' != 'PASS'
  ${step_rateToStr}=  float_to_string_2f  ${step_rate}   # at least 2 fractional point precision, avoid rounding
  Input text  id=minimalStep_0  ${step_rateToStr}

Додати причину з описом при наявності
  [Arguments]  ${data}
  ${status}  ${cause}=  Run Keyword And Ignore Error  Get From Dictionary  ${data}  cause
  log to console  check presence of cause in dictionary: ${status}
  Return From Keyword If  '${status}' != 'PASS'
  ${cause_desc}=  Get From Dictionary  ${data}  causeDescription
  Select From List By Value  id=cause             ${cause}
  Input text                 id=causeDescription  ${cause_desc}

Додати start_date_time при наявності
  [Arguments]  ${dada_data}  ${methodType}
  Return From Keyword If  '${methodType}' != 'belowThreshold'  # Специфічна поведінка нашого майданчика
  ${status}  ${start_date}=  Run Keyword And Ignore Error  get_all_etender_dates  ${dada_data}  StartDate  date
  log to console  check presence of StartDate in dictionary: ${status}
  Return From Keyword If  '${status}' != 'PASS'
  ${start_date}=  get_all_etender_dates  ${dada_data}  StartDate  date
  ${start_time}=  get_all_etender_dates  ${dada_data}  StartDate  time
  Input text  xpath=//input[@id="startDate"]       ${start_date}
  Input text  xpath=//input[@id="startDate_time"]  ${start_time}

Додати end_date_time при наявності
  [Arguments]  ${dada_data}
  ${status}  ${end_date}=  Run Keyword And Ignore Error  get_all_etender_dates  ${dada_data}  EndDate  date
  log to console  check presence of EndDate in dictionary: ${status}
  Return From Keyword If  '${status}' != 'PASS'
  ${end_date}=  get_all_etender_dates   ${dada_data}  EndDate  date
  ${end_time}=  get_all_etender_dates   ${dada_data}  EndDate  time
  Input text  xpath=//input[@id="endDate"]       ${end_date}
  Input text  xpath=//input[@id="endDate_time"]  ${end_time}

Додати enquiry_end_date_time при наявності
  [Arguments]  ${dada_data}
  ${status}  ${enquiry_end_date}=  Run Keyword And Ignore Error  get_all_etender_dates  ${dada_data}  EndPeriod  date
  log to console  check presence of enquiry_end_date in dictionary: ${status}
  Return From Keyword If  '${status}' != 'PASS'
  ${enquiry_end_date}=  get_all_etender_dates  ${dada_data}  EndPeriod  date
  ${enquiry_end_time}=  get_all_etender_dates  ${dada_data}  EndPeriod  time
  Input text  xpath=//input[@id="enquiryPeriod"]       ${enquiry_end_date}
  Input text  xpath=//input[@id="enquiryPeriod_time"]  ${enquiry_end_time}

add feature tender
  [Arguments]  ${feature}  ${feature_index}
  ${title}=        Get From Dictionary  ${feature}  title
  ${description}=  Get From Dictionary  ${feature}  description
  ${options}=      Get From Dictionary  ${feature}  enum
  scrollIntoView by script using xpath  //add-features[contains(@feature-sector,"tender")]//span[@ng-click="addFeature()"]  # scroll to addFeature button - tender
  sleep   2
  Click element  xpath=//add-features[contains(@feature-sector,"tender")]//span[@ng-click="addFeature()"]
  Sleep    2
  Input text  name=feature-tender${feature_index}  ${title}
  Input text  xpath=//input[@name="feature-tender${feature_index}"]/parent::td/following-sibling::td/input[@type="text"]  ${description}
  Sleep    2
  ${number_of_options}=  Get Length  ${options}
  :FOR  ${i}  IN RANGE  ${number_of_options}
  \     scrollIntoView by script using xpath  //add-features[contains(@feature-sector,"tender")]//button[@ng-click="addFeatureOption(feature)"]
  \     Click element  xpath=//add-features[contains(@feature-sector,"tender")]//button[@ng-click="addFeatureOption(feature)"]
  \     Sleep    2
  \     ${opt_title}=  Get From Dictionary  ${feature.enum[${i}]}  title
  \     ${opt_value}=  Get From Dictionary  ${feature.enum[${i}]}  value
  \     ${opt_value}=  Convert To Number  ${opt_value}
  \     ${opt_value}=  Convert To Integer  ${opt_value*100}
  \     ${opt_value}=  Convert To String  ${opt_value}
  \     Input text  name=feature-tenderOption${feature_index}${i}  ${opt_title}
  \     Input text  id=feature-tenderOptionValue${feature_index}${i}  ${opt_value}

add feature item
  [Arguments]  ${feature}  ${feature_index}
  ${title}=        Get From Dictionary  ${feature}  title
  ${description}=  Get From Dictionary  ${feature}  description
  ${options}=      Get From Dictionary  ${feature}  enum
  scrollIntoView by script using xpath  //add-features[contains(@feature-sector,"item")]//span[@ng-click="addFeature()"]  # scroll to addFeature button - item
  sleep   2
  Click element  xpath=//add-features[contains(@feature-sector,"item")]//span[@ng-click="addFeature()"]
  Sleep    2
  Input text  name=feature-item${feature_index}  ${title}
  Input text  xpath=//input[@name="feature-item${feature_index}"]/parent::td/following-sibling::td/input[@type="text"]  ${description}
  Sleep    2
  ${number_of_options}=   Get Length              ${options}
  :FOR  ${i}  IN RANGE  ${number_of_options}
  \     scrollIntoView by script using xpath  (//add-features[contains(@feature-sector,"item")]//button[@ng-click="addFeatureOption(feature)"])[${feature_index}+1]  # addFeatureOption - item
  \     sleep   2
  \     Click element  xpath=(//add-features[contains(@feature-sector,"item")]//button[@ng-click="addFeatureOption(feature)"])[${feature_index}+1]
  \     Sleep    2
  \     ${opt_title}=  Get From Dictionary  ${feature.enum[${i}]}  title
  \     ${opt_value}=  Get From Dictionary  ${feature.enum[${i}]}  value
  \     ${opt_value}=  Convert To Number  ${opt_value}
  \     ${opt_value}=  Convert To Integer  ${opt_value*100}
  \     ${opt_value}=  Convert To String  ${opt_value}
  \     Input text  name=feature-itemOption${feature_index}${i}  ${opt_title}
  \     Input text  id=feature-itemOptionValue${feature_index}${i}  ${opt_value}

add feature lot
  [Arguments]  ${feature}  ${feature_index}
  ${title}=        Get From Dictionary  ${feature}  title
  ${description}=  Get From Dictionary  ${feature}  description
  ${options}=      Get From Dictionary  ${feature}  enum
  scrollIntoView by script using xpath  //add-features[contains(@feature-sector,"lot")]//span[@ng-click="addFeature()"]  # scroll to addFeature button - lot
  sleep   2
  Click element  xpath=//add-features[contains(@feature-sector,"lot")]//span[@ng-click="addFeature()"]
  Sleep    2
  Input text  name=feature-lot${feature_index}  ${title}
  Input text  xpath=//input[@name="feature-lot${feature_index}"]/parent::td/following-sibling::td/input[@type="text"]  ${description}
  Sleep    2
  ${number_of_options}=   Get Length              ${options}
  :FOR  ${i}  IN RANGE  ${number_of_options}
  \     scrollIntoView by script using xpath  //add-features[contains(@feature-sector,"lot")]//button[@ng-click="addFeatureOption(feature)"]  # addFeatureOption - lot
  \     sleep   2
  \     Click element  xpath=//add-features[contains(@feature-sector,"lot")]//button[@ng-click="addFeatureOption(feature)"]
  \     Sleep    2
  \     ${opt_title}=  Get From Dictionary  ${feature.enum[${i}]}  title
  \     ${opt_value}=  Get From Dictionary  ${feature.enum[${i}]}  value
  \     ${opt_value}=  Convert To Number  ${opt_value}
  \     ${opt_value}=  Convert To Integer  ${opt_value*100}
  \     ${opt_value}=  Convert To String  ${opt_value}
  \     Input text  name=feature-lotOption${feature_index}${i}  ${opt_title}
  \     Input text  id=feature-lotOptionValue${feature_index}${i}  ${opt_value}

Створити план
  [Arguments]  ${username}  ${arguments}
#  [Documentation]
#  ...      ${ARGUMENTS[0]} ==  username
#  ...      ${ARGUMENTS[1]} ==  plan_data
  Log  ${arguments}
  ${plan}=              Get From Dictionary     ${arguments}                    data
  ${items}=             Get From Dictionary     ${plan}                         items
  ${description}=       Get From Dictionary     ${plan.budget}                  description
  ${amount}=            Get From Dictionary     ${plan.budget}                  amount
  ${amount}=            float_to_string_2f      ${amount}
  ${number_of_items}=   Get Length              ${items}
  ${cpv_id}=          Get From Dictionary       ${plan.classification}          id
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Wait Until Element Is Visible     id=qa_myPlans
  Click Element         id=qa_myPlans
  Wait Until Element Is Visible     jquery=a[href^="#/createPlan"]
  Click element         jquery=a[href^="#/createPlan"]
  Wait Until Element Is Visible     id=description
  Input text            id=description          ${description}
  Input text            id=value                ${amount}
  Select From List By Index     xpath=//select[@name="startDateMonth"]          6
  Click element         css=input.btn-cpv
  Wait Until Element Is Visible     css=#planClassification input
  Input text            css=#planClassification input                           ${cpv_id}
  Sleep  3
  Click element         xpath=//td[contains(.,'${cpv_id}')]
  Click element         xpath=//button[contains(.,'Зберегти та вийти')]
  :FOR  ${i}  IN RANGE  ${number_of_items}
  \     Wait Until Element Is Visible       //button[@ng-click="addItem()"]
  \     scrollIntoView by script using xpath  //button[@ng-click="addItem()"]
  \     Click element           xpath=//button[@ng-click='addItem()']
  \     ${item_description}=    Get From Dictionary         ${items[${i}]}          description
  \     Input text              id=itemsDescription${i}     ${item_description}
  \     ${item_quantity}=       Get From Dictionary         ${items[${i}]}          quantity
  \     Input text              id=itemsQuantity${i}        ${item_quantity}
  \     ${item_unit}=           Get From Dictionary         ${items[${i}].unit}     name
  \     Input text              xpath=//unit[@id='unit_${i}']//input[@type="search"]                 ${item_unit}
  \     Press Key               xpath=//unit[@id='unit_${i}']//input[@type="search"]                 \\13
  \     Sleep   2
  \     Click Element           xpath=//div[contains(@ng-model,'unit.selected')]//span[@class="ui-select-highlight"]
  scrollIntoView by script using xpath  //button[contains(., "Створити план")]
  Click element         xpath=//button[contains(., 'Створити план')]
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Wait Until Keyword Succeeds   2x  10 sec  Дочекатися завершення обробки плану
  ${plan_id}=                        Get Text  id=planId_0
  [Return]  ${plan_id}


Опрацювати дотаткові класифікації
  [Arguments]  ${additionalClassifications}  ${index}
  # TODO: Обробляти випадок коли є більше однієї додаткової класифікації
  ${scheme}=  Get From Dictionary  ${additionalClassifications[0]}  scheme
  Run Keyword And Return  Вказати ${scheme} дотаткову класифікацію  ${additionalClassifications[0]}  ${index}

Вказати INN дотаткову класифікацію
  [Arguments]  ${additionalClassification}  ${index}
  ${description}=  Get From Dictionary  ${additionalClassification}  description
  Click Element  xpath=//input[@id='openAddClassificationInnModal0${index}']
  Sleep  3
  Input text     xpath=//div[@id="addClassificationInn_0_${index}" and contains(@class,"top")]//input  ${description}
  Wait Until Element Is Visible  xpath=//td[contains(., '${description}')]
  Sleep  2
  Click Element  xpath=//td[contains(., '${description}')]
  Sleep  1
  Click Element  xpath=//div[@id="addClassificationInn_0_${index}" and contains(@class,"top")]//button[@id="addClassification_choose"]

Вказати ДК003 дотаткову класифікацію
  [Arguments]  ${additionalClassification}  ${index}
  ${description}=  Get From Dictionary  ${additionalClassification}  description
  Click Element  id=openAddClassificationModal0${index}0
  Sleep  3
  Select From List By Value  xpath=//div[@id="addClassification" and contains(@class,"modal")]//select[@name="dkScheme"]  ДК003
  Sleep  3
  Input text     xpath=//div[@id="addClassification" and contains(@class,"modal")]//input  ${description}
  Wait Until Element Is Visible  xpath=//td[contains(., '${description}')]
  Sleep  2
  Click Element  xpath=//td[contains(., '${description}')]
  Sleep  1
  Click Element  xpath=//div[@id="addClassification" and contains(@class,"modal")]//*[@id="addClassification_choose"]

Вказати ДК018 дотаткову класифікацію
  [Arguments]  ${additionalClassification}  ${index}
  ${description}=  Get From Dictionary  ${additionalClassification}  description
  Click Element  id=openAddClassificationModal0${index}0
  Sleep  3
  Select From List By Value  xpath=//div[@id="addClassification" and contains(@class,"modal")]//select[@name="dkScheme"]  ДК018
  Sleep  3
  Input text     xpath=//div[@id="addClassification" and contains(@class,"modal")]//input  ${description}
  Wait Until Element Is Visible  xpath=//td[contains(., '${description}')]
  Sleep  2
  Click Element  xpath=//td[contains(., '${description}')]
  Sleep  1
  Click Element  xpath=//div[@id="addClassification" and contains(@class,"modal")]//*[@id="addClassification_choose"]

Вказати ДК015 дотаткову класифікацію
  [Arguments]  ${additionalClassification}  ${index}
  ${description}=  Get From Dictionary  ${additionalClassification}  description
  Click Element  id=openAddClassificationModal0${index}0
  Sleep  3
  Select From List By Value  xpath=//div[@id="addClassification" and contains(@class,"modal")]//select[@name="dkScheme"]  ДК015
  Sleep  3
  Input text     xpath=//div[@id="addClassification" and contains(@class,"modal")]//input  ${description}
  Wait Until Element Is Visible  xpath=//td[contains(., '${description}')]
  Sleep  2
  Click Element  xpath=//td[contains(., '${description}')]
  Sleep  1
  Click Element  xpath=//div[@id="addClassification" and contains(@class,"modal")]//*[@id="addClassification_choose"]

Вказати ДКПП дотаткову класифікацію
  [Arguments]  ${additionalClassification}  ${index}
  log  Це щось старе, і його мають прибрати. Не буду нічого тут робити!  WARN

Enter enquiry date
  [Arguments]  ${enquiry_end_date}  ${enquiry_end_time}
  Input text    xpath=//input[@id="enquiryPeriod"]   ${enquiry_end_date}
  Sleep   1
  Input text    xpath=//input[@id="enquiryPeriod_time"]   ${enquiry_end_time}
  Sleep   1


Дочекатися завершення обробки тендера
  Reload Page
  Sleep   25
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Wait Until Element Is Visible      ${locator.tenderId}  30
  ${tender_id}=                      Get Text  ${locator.tenderId}
  Should Match Regexp                ${tender_id}  UA-\\d{4}-\\d{2}-\\d{2}-\\d+.*


Дочекатися завершення обробки плану
  Reload Page
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Wait Until Element Is Visible      id=planId_0  30
  ${plan_id}=                        Get Text  id=planId_0
  Log  ${plan_id}
  Should Match Regexp                ${plan_id}  UA-P-\\d{4}-.*


Задати запитання на тендер
  [Arguments]  ${username}  ${tender_uaid}  ${question}
  Задати запитання на  Тендер  0  ${question}

Задати запитання на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${question}
  Задати запитання на  Предмет  0  ${question}

Задати запитання на лот
  [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${question}
  Задати запитання на  Лот  ${lot_id}  ${question}

Задати запитання на
  [Arguments]  ${entity}  ${lot_id}  ${question}
  Log  ${question}
  Відкрити розділ запитань
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Wait Until Page Contains Element   id=askQuestion
  Click Element  id=askQuestion
  Wait Until Page Does Not Contain      ${locator_block_overlay}
  Run Keyword If  '${entity}'=='Лот'    Вибрати лот запитання  ${lot_id}
  Wait Until Page Contains Element      id=title
  Input text        id=title            ${question.data.title}
  Input text        id=description      ${question.data.description}
  Click Element     id=sendQuestion
  Sleep  15  # wait for export

Вибрати лот запитання
  [Arguments]  ${lot_id}
  Select From List By Label  xpath=//*[@ng-model="vm.questionTo"]  Лоту
  ${lot}=       Get Text      xpath=//option[contains(.,'${lot_id}')]
  Select From List By Label  xpath=//*[@ng-model="vm.question.lot"]     ${lot}

Завантажити док
  [Arguments]  ${username}  ${file}  ${locator}
  # TODO: Rework this tricky behavior someday?
  # Autotest cannot upload file directly, because there is no INPUT element on page. Need to click on button first,
  # but this will open OS file selection dialog. So we close and reopen browser to get rid of this dialog
  ${tmp_location}=  Get Location
  scrollIntoView by script using xpath  ${locator}
  Click Element   ${locator}
  Choose File     xpath=//input[@type="file"]  ${file}
  Sleep   4
  Capture Page Screenshot
  Close Browser
  etender.Підготувати клієнт для користувача  ${username}
  Go To  ${tmp_location}
  Sleep  5

Завантажити документ
  [Arguments]  ${username}  ${file}  ${tender_uaid}
  [Documentation]
  ...   Загрузка дока в тендер
  sleep   2
  Select From List By Label  xpath=//div[@id="tree-01-02"]//select[@id="docType"]  Інші
  log  ${file}
  Sleep     5
  Завантажити док  ${username}  ${file}  id=tend_doc_add
  Sleep     5

Додати предмети
  [Arguments]  ${methodTypeT}  ${items}
  ${items_count}=  Get Length  ${items}
  :FOR  ${i}  IN RANGE  ${items_count}
  \     Додати предмет  ${methodTypeT}  ${items[${i}]}  ${i}

Додати предмет
  [Arguments]  ${methodTypeT}  ${item}  ${index}
  ${items_description}=  Get From Dictionary  ${item}                   description
  ${items_descriptionEN}=  Get From Dictionary  ${item}                 description_en
  ${quantity}=           Get From Dictionary  ${item}                   quantity
  ${unit}=               Get From Dictionary  ${item.unit}              name
  ${cpv}=                Get From Dictionary  ${item.classification}    id
  ${dkpp_desc}=          Get From Dictionary  ${item.additionalClassifications[0]}  description
  ${dkpp_id}=            Get From Dictionary  ${item.additionalClassifications[0]}  id
  ${deliveryDateStart}=  Get From Dictionary  ${item.deliveryDate}      startDate
  ${deliveryDateEnd}=    Get From Dictionary  ${item.deliveryDate}      endDate
  ${deliveryDateStart}=  convert_date_to_etender_format  ${deliveryDateStart}
  ${deliveryDateEnd}=    convert_date_to_etender_format  ${deliveryDateEnd}
  ${latitude}=           Get From Dictionary  ${item.deliveryLocation}  latitude
  ${longitude}=          Get From Dictionary  ${item.deliveryLocation}  longitude
  ${region}=             Get From Dictionary  ${item.deliveryAddress}   region
  ${region}=             convert_common_string_to_etender_string  ${region}
  ${locality}=           Get From Dictionary  ${item.deliveryAddress}   locality
  ${locality}=           convert_common_string_to_etender_string  ${locality}
  ${postalCode}=         Get From Dictionary  ${item.deliveryAddress}   postalCode
  ${streetAddress}=      Get From Dictionary  ${item.deliveryAddress}   streetAddress
  ${methodType}=         Set Variable  ${methodTypeT}

  Run Keyword If  '${index}' != '0'  Click Element  id=addLotItem_0
  Sleep  3
  Input text    id=itemsDescription0${index}      ${items_description}
  Sleep  1
  Run Keyword If     '${methodType}' == 'aboveThresholdEU'  Input text    id=itemsDescriptionEN0${index}      ${items_descriptionEN}
  Sleep  1
  Input text    id=itemsQuantity0${index}         ${quantity}
  Click Element   xpath=(//div[contains(@ng-model,"unit.selected")]//input[@type="search"])[${index}+1]
  Sleep  3
  Input text    xpath=(//div[contains(@ng-model,"unit.selected")]//input[@type="search"])[${index}+1]  ${unit}
  Sleep  2
  Click Element   xpath=//div[contains(@class,"selectize-dropdown") and contains(@repeat,"unit")]//div[@role="option" and contains(@class,"active")]
  Sleep  5
  scrollIntoView by script using xpath  //input[@id="openClassificationModal0${index}"]  # openClassificationModal - main
  sleep   2
  Click Element  id=openClassificationModal0${index}
  Sleep  1
  Input text     id=classificationCode  ${cpv}
  Wait Until Element Is Visible  xpath=//td[contains(., '${cpv}')]
  Sleep  2
  Click Element  xpath=//td[contains(., '${cpv}')]
  Sleep  1
  Click Element  id=classification_choose
  Sleep  3
  ${status}  ${value}=  Run Keyword And Ignore Error  Get From Dictionary  ${item}  additionalClassifications
  log to console       Attempt to get 1st additonal classification scheme: ${status}
  Run Keyword If      '${status}' == 'PASS'   Опрацювати дотаткові класифікації  ${item.additionalClassifications}  ${index}
#  Input text    id=latitude0    ${latitude}
#  Sleep   1
#  Input text    id=longitude0   ${longitude}
  Sleep  2
  Input text    id=delStartDate0${index}        ${deliveryDateStart}
  Sleep  2
  Input text    id=delEndDate0${index}          ${deliveryDateEnd}
  Sleep  2
  Select From List By Label  id=region_0${index}  ${region}
  Sleep  2
  #  TODO: sync this region/locality selection logic with keyword -- Створити постачальника, додати документацію і підтвердити його
  Run Keyword If  '${region}' != 'Київ'  Input text  name=otherCity_0${index}  ${locality}
  Input text    id=street_0${index}   ${streetAddress}
  Sleep  1
  Input text    id=postIndex_0${index}    ${postalCode}

Додати неціновий показник на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${feature_data}  ${object_id}
  Selenium2Library.Switch Browser    ${username}
  etender.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
  Wait Until Page Contains Element   xpath=//a[contains(@class,'btn btn-primary') and .='Редагувати закупівлю']   ${huge_timeout_for_visibility}
  Sleep  2
  Click Element              xpath=//a[contains(@class,'btn btn-primary') and .='Редагувати закупівлю']
  Sleep  2
  ${feature_of}=  Get From Dictionary  ${feature_data}  featureOf
  Run Keyword If  '${feature_of}' == 'lot'       add feature lot     ${feature_data}  1
  Run Keyword If  '${feature_of}' == 'tenderer'  add feature tender  ${feature_data}  1
  Run Keyword If  '${feature_of}' == 'item'      add feature item    ${feature_data}  1
  Sleep  2
  Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
  Click Element            id=SaveChanges
  Sleep  2
  Run Keyword And Ignore Error  Click Element  xpath=//div[@id="SignModal" and //div[contains(@class,"modal-dialog")]//div[contains(.,"будь ласка, перевірте статус")]]//button[.="Закрити"]  #close info dialog, if present

Видалити неціновий показник
  [Arguments]  ${username}  ${tender_uaid}  ${feature_id}
  Selenium2Library.Switch Browser    ${username}
  etender.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
  Wait Until Page Contains Element   xpath=//a[contains(@class,'btn btn-primary') and .='Редагувати закупівлю']   ${huge_timeout_for_visibility}
  Sleep  2
  Click Element              xpath=//a[contains(@class,'btn btn-primary') and .='Редагувати закупівлю']
  Sleep  2
  ${features_count}=  Selenium2Library.Get Element Count  xpath=//input[contains(@name,"feature-item") and @ng-model="feature.title"]
  :FOR  ${i}  IN RANGE  ${features_count}
  \     ${feature_title}=  Get Value  name=feature-item${i}
  \     ${contains}=  Evaluate   "${feature_id}" in """${feature_title}"""
  \     Run Keyword If  '${contains}' == 'True'  Видалити вказаний неціновий показник з предмету  ${i}  # delete feature
  Sleep  2
  Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
  Click Element            id=SaveChanges
  Sleep  2
  Run Keyword And Ignore Error  Click Element  xpath=//div[@id="SignModal" and //div[contains(@class,"modal-dialog")]//div[contains(.,"будь ласка, перевірте статус")]]//button[.="Закрити"]  #close info dialog, if present

Видалити вказаний неціновий показник з предмету
  [Arguments]  ${feature_index}
  ${delete_button_xpath}=  Set Variable  (//add-features[contains(@feature-sector,"item")]//button[@ng-click="removeFeature($index)"])[${feature_index}+1]
  scrollIntoView by script using xpath  ${delete_button_xpath}
  sleep   2
  Click Element  xpath=${delete_button_xpath}  # delete feature button - item

Клацнути і дочекатися
  [Arguments]  ${tender_link}
  Click Link  jquery=a[ng-click='search()']
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Wait Until Page Contains Element   ${tender_link}  5

Пошук тендера по ідентифікатору
  [Arguments]  ${username}  ${tender_uaid}  @{ARGUMENTS}
  Reload Page
  Run Keyword If  '${username}' != 'Etender_Owner'  Run Keyword And Return  Тимчасовий Пошук тендера по ідентифікатору для Viewer  ${username}  ${tender_uaid}
  Go To  ${USERS.users['${username}'].homepage}
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Перейти на вкладку іншого типу процедур за потреби  ${username}
  Wait Until Element Is Visible    ${locator.search_tender}    10
  Input Text    ${locator.search_tender}    ${tender_uaid}
  ${timeout_on_wait}=  Get Broker Property By Username  ${username}  timeout_on_wait
  ${tender_link}=   Set Variable    xpath=//td[contains(.,'${tender_uaid}')]//a
  ${passed}=  Run Keyword And Return Status  Wait Until Keyword Succeeds  ${timeout_on_wait} s  0 s  Клацнути і дочекатися  ${tender_link}
  Run Keyword Unless  ${passed}  Fatal Error  Тендер не знайдено за ${timeout_on_wait} секунд
  Click Link    ${tender_link}
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Wait Until Page Contains    ${tender_uaid}   10

Тимчасовий Пошук тендера по ідентифікатору для Viewer
  [Arguments]  ${username}  ${TENDER_UAID}
  # TODO: У майбутньому треба буде запровадити більш коректне рішення
  # Виникла необхідність обійти пошук по ідентифікатору через особливість тестового оточення майданчика
  ${cleared_homepage_site}=  Set Variable  ${USERS.users['${username}'].homepage}
  ${cleared_homepage_site}=  Set Variable  ${cleared_homepage_site.split('#')[0]}
  Go To  ${cleared_homepage_site}tender?tenderid=${TENDER_UAID}

Перейти на вкладку іншого типу процедур за потреби
  [Arguments]  ${username}
  ${search_tab}=  Get From Dictionary  ${USERS.users['${username}']}  HELPER_SEARCH_TAB
  Return From Keyword If  '${search_tab}' == 'КОНКУРЕНТНІ ПРОЦЕДУРИ'
  scrollIntoView by script using xpath  //*[@id="naviTitle1"]  # scroll to tab 'НЕКОНКУРЕНТНІ ПРОЦЕДУРИ'
  sleep   2
  Click Element  id=naviTitle1
  Wait Until Page Does Not Contain   ${locator_block_overlay}

Пошук плану по ідентифікатору
  [Arguments]  ${username}  ${TENDER_UAID}
  Log  ${username}
  Go To  ${USERS.users['${username}'].homepage}
  Wait Until Element Is Visible         id=naviTitle2
  Sleep  3
  JavaScript scrollBy  0  -2000
  Click Element                         id=naviTitle2
  #Wait Until Page Contains Element    xpath=//input[@type='text' and @placeholder='Пошук за номером плану']    10
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  sleep  1
  Wait Until Element Is Visible    xpath=//input[@type='text' and @placeholder='Пошук за номером плану']    10
  sleep  3
  Input Text    xpath=//input[@type='text' and @placeholder='Пошук за номером плану']   ${TENDER_UAID}
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Wait Until Page Contains  ${TENDER_UAID}  10


Завантажити документ в ставку
  [Arguments]  ${username}  ${file}  ${tender_uaid}  ${doc_type}=1
  etender.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Відкрити розділ пропозицій
  Натиснути редагувати пропозицію
  Run Keyword And Ignore Error  Обрати конфіденційність документа
  ${doc_type}=          get_doc_type_index          ${doc_type}
  Select From List By Index     id=bidDocType_      ${doc_type}
  Завантажити док  ${username}  ${file}  id=addBidDoc_
  Sleep  5

Обрати конфіденційність документа
  [Arguments]  ${conf}=1
  Select From List By Index     id=bidDocConf_   ${conf}

Змінити документ в ставці
  [Arguments]  ${username}  ${tender_uaid}  ${file}  ${doc_id}
  Log  ${doc_id}
  Sleep     3
  Відкрити розділ пропозицій
  Click Element     xpath=//label[@for="showBidDocs00"]
  Sleep     1
  Click Element     id=changeDoc_0
  Sleep     3
  Завантажити док  ${username}  ${file}  id=updateBidDoc_0

Завантажити документ в лот
  [Arguments]  ${username}  ${file}  ${tender_uaid}  ${lot_id}
  sleep   2
  Select From List By Label  xpath=//div[@id="treetree-01-02-0"]//select[@id="docType"]  Інші
  Sleep   1
  Завантажити док  ${username}  ${file}  id=lot_doc_add

Заповнити нецінові критерії
  [Arguments]  ${features_ids}  ${parameters}
  ${count}=  Get Length  ${features_ids}
  :FOR  ${i}  IN RANGE  ${count}
  \     Run Keyword  Вибрати неціновий критерій  ${features_ids[${i}]}  ${parameters[${i}]['value']}

Вибрати неціновий критерій
  [Arguments]  ${feature_id}  ${value}
  ${index}=  get_feature_index  ${value}
  Select From List By Index  xpath=//span[contains(.,'${feature_id}')]/../..//select  ${index}
  Sleep  1

Пітдвердити чекбокси пропозиції
  Select Checkbox  id=selfEligible
  Select Checkbox  id=selfQualified

Подати цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${bid_data}  ${lots_ids}  ${features_ids}
  etender.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  sleep  5
  Відкрити розділ пропозицій
  ${amount}=    Run Keyword If  ${lots_ids} is None  Set Variable  ${bid_data.data.value.amount}
  ...           ELSE  Set Variable  ${bid_data.data.lotValues[0].value.amount}
  Input String      id=amount0      ${amount}
  Run Keyword And Ignore Error      Пітдвердити чекбокси пропозиції
  Run Keyword Unless  ${features_ids} is None  Заповнити нецінові критерії  ${features_ids}  ${bid_data.data.parameters}
  Click Element     id=createBid_0
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  sleep  3

Отримати інформацію із пропозиції
  [Arguments]  ${username}  ${tender_uaid}  ${field}
  etender.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Відкрити розділ пропозицій
  Run Keyword And Return If  'value' in '${field}'  Отримати інформацію про value пропозиції
  Run Keyword And Return  Отримати інформацію про ${field} пропозиції

Отримати інформацію про value пропозиції
  ${value}=     Get Text        id=bidAmount0
  ${value}=     parse_currency_value_with_spaces    ${value}
  Run Keyword And Return  Convert To Number  ${value}

Отримати інформацію про status пропозиції
  ${value}=     Get Text        id=bidStatus0
  Run Keyword And Return  convert_etender_string_to_common_string  ${value}

Змінити цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${field}  ${value}
  etender.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Sleep    5
  Run Keyword If  '${field}'=='status'  Підтвердити пропозицію
  Run Keyword If  'value' in '${field}'  Редагувати суму пропозиції  ${value}
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Sleep    1

Редагувати суму пропозиції
  [Arguments]  ${value}
  Натиснути редагувати пропозицію
  Input String      id=amount0       ${value}
  Click Element     id=updateBid_0

Підтвердити пропозицію
  Click Element     id=confirmBid_0

Натиснути редагувати пропозицію
  Click Element     id=editBid_0

Скасувати цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  3
  Click Element               xpath=//button[contains(@class, 'btn-sm btn-danger')]
  sleep  5

Оновити сторінку з тендером
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  #etender.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Reload Page

Оновити сторінку з планом
  [Arguments]  @{ARGUMENTS}
  Reload Page

Створити вимогу про виправлення умов лоту
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${lot_id}  ${file}
  Run Keyword And Return  Створити вимогу про виправлення умов  ${username}  ${tender_uaid}  ${claim}  ${lot_id}  ${file}

Створити вимогу про виправлення умов закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${file}
  Run Keyword And Return  Створити вимогу про виправлення умов  ${username}  ${tender_uaid}  ${claim}  тендер  ${file}

Створити вимогу про виправлення умов
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${target}  ${file}
  etender.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  sleep  5
  ${complaintID}=  Створити чернетку вимоги  ${username}  ${tender_uaid}  ${claim}  ${target}
  Завантажити док  ${username}  ${file}  //*[@id="addClaimDoc"]  #xpath because of scrolling keyword
  Відкрити розділ вимог і скарг
  Click Element     xpath=//button[contains(.,'Опублікувати вимогу')]
  [Return]  ${complaintID}

Створити чернетку вимоги
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${target}
  Відкрити розділ вимог і скарг
  scrollIntoView by script using xpath  //*[@id="addClaim"]
  Click Element     id=addClaim
  sleep  5
  Input Text        id=title            ${claim.data.title}
  Input Text        id=description      ${claim.data.description}
  Select From List By Partial Label     id=complaintFor  ${target}
  Click Element     id=btnAddComplaint
  Sleep  10
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Run Keyword And Return  Get text  xpath=//complaint[contains(.,"${claim.data.description}")]//div[@id='complaintid']

Створити чернетку вимоги про виправлення умов лоту
  [Arguments]  ${username}  ${tender_uaid}   ${claim}  ${target}
  Run Keyword And Return  Створити чернетку вимоги  ${username}  ${tender_uaid}   ${claim}  ${target}

Створити чернетку вимоги про виправлення умов закупівлі
  [Arguments]  ${username}  ${tender_uaid}   ${claim}
  Run Keyword And Return  Створити чернетку вимоги  ${username}  ${tender_uaid}   ${claim}  тендер

Скасувати вимогу
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}
  etender.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Sleep  5
  Відкрити розділ вимог і скарг
  Click Element  xpath=//div[@id='${complaintID}']//*[@name='CancelComplaint']
  Sleep  1
  Input Text     id=cancellationReason      ${cancellation_data.data.cancellationReason}
  Click Element  id=btnCancelComplaint
  Sleep  5

Скасувати вимогу про виправлення умов закупівлі
  [Arguments]  @{arguments}
  Скасувати вимогу  @{arguments}

Скасувати вимогу про виправлення умов лоту
  [Arguments]  @{arguments}
  Скасувати вимогу  @{arguments}


Select From List By Partial Label
  [Arguments]  ${locator}  ${label}
  [Documentation]  If more than one option is given for a single-selection list, the first value will be selected.
  ${targets_list}=  Get List Items      ${locator}
  ${label}=        Get Matches         ${targets_list}     regexp=.*${label}.*
  Select From List By Label     ${locator}     ${label[0]}

Отримати інформацію із документа до скарги
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${doc_id}  ${field}
  ${raw_value}=  Get Text  xpath=//a[contains(.,'${doc_id}')]
  [Return]  ${raw_value.split(', ')[-1]}

Отримати інформацію із скарги
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${field}  ${award_index}
  Відкрити розділ вимог і скарг
  ${status}=  Run Keyword And Return Status  Розкрити інформацію про скаргу  ${complaintID}
  Run Keyword If  '${status}'=='FAIL'  Run Keywords  Reload Page  Відкрити розділ вимог і скарг  Розкрити інформацію про скаргу
  Run Keyword And Return  Отримати інформацію із скарги про ${field}  ${complaintID}

Розкрити інформацію про скаргу
  [Arguments]  ${complaintID}
  ${is_expanded}=  Get Element Attribute  xpath=//div[@id='${complaintID}']/div@aria-selected
  Run Keyword If  '${is_expanded}'=='false'  Click Element  xpath=//div[@id='${complaintID}']//a

Отримати інформацію із скарги про title
  [Arguments]  ${complaintID}
  Run Keyword And Return  Get Element Attribute  xpath=//div[@id='${complaintID}']//*[@name='title']@title

Отримати інформацію із скарги про description
  [Arguments]  ${complaintID}
  Run Keyword And Return  Get Text  xpath=//div[@id='${complaintID}']//*[@name='description']

Отримати інформацію із скарги про resolutionType
  [Arguments]  ${complaintID}
  ${resolutionType}=      Get Text  xpath=//div[@id='${complaintID}']//*[@name='resolutionType']
  Run Keyword And Return  convert_etender_string_to_common_string  ${resolutionType.lower()}

Отримати інформацію із скарги про resolution
  [Arguments]  ${complaintID}
  Run Keyword And Return  Get Text  xpath=//div[@id='${complaintID}']//*[@name='resolution']

Отримати інформацію із скарги про satisfied
  [Arguments]  ${complaintID}
  ${satisfied}=  Get Text  xpath=//div[@id='${complaintID}']//*[@name='satisfied']
  ${satisfied}=  Set Variable  ${satisfied.replace(u'Так',u'True' )}
  ${satisfied}=  Set Variable  ${satisfied.replace(u'Ні', u'False')}
  Run Keyword And Return  Convert To Boolean  ${satisfied}

Отримати інформацію із скарги про status
  [Arguments]  ${complaintID}
  Reload Page
  Відкрити розділ вимог і скарг
  ${status}=  Get Text  xpath=//div[@id='${complaintID}']//*[@name='status']
  Run Keyword And Return  convert_etender_string_to_common_string  ${status.lower()}

Отримати інформацію із скарги про cancellationReason
  [Arguments]  ${complaintID}
  Run Keyword And Return  Get Text  xpath=//div[@id='${complaintID}']//*[@name='cancellationReason']

Підтвердити вирішення вимоги про виправлення умов закупівлі
  [Arguments]  @{arguments}
  Підтвердити вирішення вимоги про виправлення умов  @{arguments}

Підтвердити вирішення вимоги про виправлення умов лоту
  [Arguments]  @{arguments}
  Підтвердити вирішення вимоги про виправлення умов  @{arguments}

Підтвердити вирішення вимоги про виправлення умов
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${data}
  Reload Page
  Відкрити розділ вимог і скарг
  ${satisfied}=  Get From Dictionary  ${data}  data
  ${satisfied}=  Get From Dictionary  ${satisfied}  satisfied
  ${satisfied}=  Convert To String    ${satisfied}
  Click Element  xpath=//div[@id='${complaintID}']//button[contains(@click-and-disable,'${satisfied.lower()}')]

Відповісти на запитання
  [Arguments]  ${username}  ${tender_uaid}  ${answer_data}  ${question_id}
  ${answer}=     Get From Dictionary  ${answer_data.data}  answer
  Selenium2Library.Switch Browser    ${username}
  etender.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  sleep   10
  Відкрити розділ запитань
  scrollIntoView by script using xpath  //*[@id="addAnswer_0"]  # scroll to addAnswer button
  sleep   4
  Click Element                      id=addAnswer_0
  scrollIntoView by script using xpath  //*[@id="questionContainer"]/form/div/textarea  # scroll to questionContainer
  sleep   4
  Input text                         xpath=//*[@id="questionContainer"]/form/div/textarea            ${answer}
  sleep   2
  scrollIntoView by script using xpath  //*[@id="questionContainer"]/form/div/span/button[1]  # scroll to submit answer V-button
  sleep   4
  Click Element                      xpath=//*[@id="questionContainer"]/form/div/span/button[1]
  sleep  5

Відкрити розділ запитань
  scrollIntoView by script using xpath  //li[@id="naviTitle2"]/span  # scroll to questions tab
  sleep   1
  Click Element                      xpath=//li[@id="naviTitle2"]/span  # go to questions tab
  Wait Until Page Does Not Contain   ${locator_block_overlay}

scrollIntoView by script using xpath
  [Arguments]  ${xpath_locator}
  [Documentation]  use xpath with "double quotes"
  Execute JavaScript  document.evaluate('${xpath_locator}', document.documentElement, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).scrollIntoView();
  JavaScript scrollBy  0  -100

JavaScript scrollBy
  [Arguments]  ${x_offset}  ${y_offset}
  Execute JavaScript  window.scrollBy(${x_offset}, ${y_offset})

Input String
  [Arguments]  ${locator}  ${value}
  [Documentation]  Converts value to string and inputs to locator field
  ${value}=     Convert To String       ${value}
  Input text    ${locator}              ${value}

Check Is Element Loaded
  [Arguments]  ${locator}
  ${text_value}=   Get Text  ${locator}
  Log  ${text_value}
  Should Not Be Empty  ${text_value}
  Should Not Be Equal  ${text_value}  -

Внести зміни в тендер
  [Arguments]  ${username}  ${tender_uaid}  ${field}  ${new_value}
  ${description}=   Convert To String    новое описание тендера
  Selenium2Library.Switch Browser    ${username}
  etender.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
  Wait Until Page Contains Element   xpath=//a[contains(@class,'btn btn-primary') and .='Редагувати закупівлю']   ${huge_timeout_for_visibility}
  Sleep  2
  Click Element              xpath=//a[contains(@class,'btn btn-primary') and .='Редагувати закупівлю']
  Sleep  2
  Редагувати поле тендера  ${field}  ${new_value}
  Sleep  2
  Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
  Click Element            id=SaveChanges
  Sleep  2
  ${close_btn}=  Set Variable  //div[@id="SignModal" and //div[contains(@class,"modal-dialog")]
  ${close_btn}=  Set Variable  ${close_btn}//div[contains(.,"будь ласка, перевірте статус")]]//button[.="Закрити"]
  Run Keyword And Ignore Error  Click Element  xpath=${close_btn}  #close info dialog, if present

Редагувати поле тендера
  [Arguments]  ${field}  ${new_value}
  Run Keyword And Return  Редагувати поле ${field}  ${new_value}

Редагувати поле tenderPeriod.endDate
  [Arguments]  ${new_value_isodate}
  ${date}=  convert_date_to_etender_format  ${new_value_isodate}
  Input text  id=endDate  ${date}
  ${time}=  convert_time_to_etender_format  ${new_value_isodate}
  Input text  id=endDate_time  ${time}

Редагувати поле description
  [Arguments]  ${new_value}
  Input text  id=description  ${new_value}

Змінити лот
  [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${field}  ${new_value}
  Selenium2Library.Switch Browser    ${username}
  etender.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
  Wait Until Page Contains Element   xpath=//a[contains(@class,'btn btn-primary') and .='Редагувати закупівлю']   ${huge_timeout_for_visibility}
  Sleep  2
  Click Element              xpath=//a[contains(@class,'btn btn-primary') and .='Редагувати закупівлю']
  Sleep  2
  Run Keyword  Редагувати поле лота ${field}  ${lot_id}  ${new_value}
  Sleep  2
  Execute Javascript   window.scrollTo(0, document.body.scrollHeight)
  Click Element            id=SaveChanges
  Sleep  2
  Run Keyword And Ignore Error  Click Element  xpath=//div[@id="SignModal" and //div[contains(@class,"modal-dialog")]//div[contains(.,"будь ласка, перевірте статус")]]//button[.="Закрити"]  #close info dialog, if present

Редагувати поле лота value.amount
  [Arguments]  ${lot_id}  ${new_value}
  ${new_value}=  float_to_string_2f  ${new_value}  # at least 2 fractional point precision, avoid rounding
  Input text  id=lotValue_0  ${new_value}

Редагувати поле лота minimalStep.amount
  [Arguments]  ${lot_id}  ${new_value}
  ${new_value}=  float_to_string_2f  ${new_value}  # at least 2 fractional point precision, avoid rounding
  Input text  id=minimalStep_0  ${new_value}

Отримати документ до лоту
  [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${doc_id}
  Відкрити розділ опис закупівлі
  Click Element     id=openAllLots
  Sleep  2
  Run Keyword And Return  etender.Отримати документ  ${username}  ${tender_uaid}  ${doc_id}

Отримати інформацію про status
  Reload Page
  ${return_value}=   Отримати текст із поля і показати на сторінці   status
  ${return_value}=   convert_etender_string_to_common_string  ${return_value.lower()}
  [Return]  ${return_value}

Отримати інформацію із тендера
  [Arguments]  ${username}  ${tender_uaid}  ${field}
  # TODO: It would be good to create a "smart" search, to perform search only if incorrect page opened or if page was opened too long ago
  Run keyword if  '${field}' == 'awards[0].complaintPeriod.endDate'  etender.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Run Keyword And Return  Отримати інформацію про ${field}

Отримати текст із поля і показати на сторінці
  [Arguments]   ${fieldname}
  Wait Until Element Is Visible    ${locator.${fieldname}}    1
  ${return_value}=   Get Text  ${locator.${fieldname}}
  [return]  ${return_value}

Отримати інформацію про title
  ${return_value}=   Отримати текст із поля і показати на сторінці   title
  [return]  ${return_value}

Отримати інформацію про qualificationPeriod.endDate
  Reload Page
  ${datetime}=      Отримати текст із поля і показати на сторінці  qualificationPeriod.endDate
  Run Keyword And Return  convert_etender_date_to_iso_format  ${datetime}

Отримати інформацію про description
  ${return_value}=   Отримати текст із поля і показати на сторінці   description
  [return]  ${return_value}

Отримати інформацію про minimalStep.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   minimalStep.amount
  ${return_value}=   parse_currency_value_with_spaces   ${return_value}
  ${return_value}=   Convert To Number   ${return_value}
  [return]  ${return_value}

Отримати інформацію про value.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці  value.amount
  ${return_value}=   Set Variable  ${return_value.replace(u'\xa0','')}  # nbsp converting attempt
  ${return_value}=   Set Variable  ${return_value.replace(' ','')}
  ${return_value}=   Convert To Number   ${return_value.replace(',','.')}
  [return]  ${return_value}

Отримати інформацію про items[0].deliveryLocation.latitude
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryLocation.latitude
  ${return_value}=   string_to_float   ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].deliveryLocation.longitude
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].deliveryLocation.longitude
  #${return_value}=   Convert To Number   ${return_value}
  ${return_value}=   string_to_float   ${return_value}
  [return]  ${return_value}

Отримати інформацію про value.currency
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.currency
  [return]  ${return_value}

Отримати інформацію про value.valueAddedTaxIncluded
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.valueAddedTaxIncluded
  ${return_value}=  Run Keyword If  'ПДВ' in '${return_value}'  Set Variable  True
    ...  ELSE  Set Variable  False
  Log  ${return_value}
  ${return_value}=   Convert To Boolean   ${return_value}
  [return]  ${return_value}

Отримати інформацію про causeDescription
  ${return_value}=  Отримати текст із поля і показати на сторінці  causeDescription
  [return]  ${return_value}

Отримати інформацію про cause
  ${return_value}=  Отримати текст із поля і показати на сторінці  cause
  ${return_value}=  convert_etender_string_to_common_string  ${return_value}
  [return]  ${return_value}

Отримати інформацію про contracts[0].status
  Reload Page
  Sleep  10
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Відкрити розділ пропозицій
  ${return_value}=  Отримати текст із поля і показати на сторінці  contracts[0].status
  ${return_value}=  Set Variable  ${return_value.strip()}
  ${return_value}=  convert_etender_string_to_common_string  ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].unit.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].unit.name
  ${return_value}=   convert_etender_string_to_common_string   ${return_value}
  [return]  ${return_value}


Відмітити на сторінці поле з тендера
  [Arguments]   ${fieldname}  ${locator}
  ${last_note_id}=  Add pointy note   ${locator}   Found ${fieldname}   width=200  position=bottom
  Align elements horizontally    ${locator}   ${last_note_id}
  sleep  1
  Remove element   ${last_note_id}

Отримати інформацію про tenderId
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderId
  [return]  ${return_value}

Отримати інформацію про procuringEntity.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   procuringEntity.name
  [return]  ${return_value}

Отримати інформацію про procuringEntity.address.countryName
  Sleep  10
  Відкрити розділ контактні дані
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.address.countryName
  ${return_value}=  Set Variable   ${return_value[:-1]}
  [return]  ${return_value}

Отримати інформацію про procuringEntity.address.locality
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.address.locality
  ${return_value}=  Set Variable   ${return_value[:-1]}
  [return]  ${return_value}

Отримати інформацію про procuringEntity.address.postalCode
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.address.postalCode
  ${return_value}=  Set Variable   ${return_value[:-1]}
  [return]  ${return_value}

Отримати інформацію про procuringEntity.address.region
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.address.region
  ${return_value}=  Set Variable   ${return_value[:-1]}
  [return]  ${return_value}

Отримати інформацію про procuringEntity.address.streetAddress
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.address.streetAddress
  [return]  ${return_value}

Отримати інформацію про procuringEntity.contactPoint.name
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.contactPoint.name
  [return]  ${return_value}

Отримати інформацію про procuringEntity.contactPoint.telephone
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.contactPoint.telephone
  [return]  ${return_value}

Отримати інформацію про procuringEntity.contactPoint.url
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.contactPoint.url
  [return]  ${return_value}

Отримати інформацію про procuringEntity.identifier.legalName
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.identifier.legalName
  [return]  ${return_value}

Отримати інформацію про procuringEntity.identifier.scheme
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.identifier.scheme
  ${return_value}=  Set Variable   ${return_value[:-1]}
  ${return_value}=  Set Variable   ${return_value.replace(u"Код ","")}
  ${return_value}=  Set Variable   ${return_value.replace(u"ЄДРПОУ","UA-EDR")}
  [return]  ${return_value}

Отримати інформацію про procuringEntity.identifier.id
  ${return_value}=  Отримати текст із поля і показати на сторінці   procuringEntity.identifier.id
  [return]  ${return_value}

Отримати інформацію про tenderPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  tenderPeriod.startDate
  ${return_value}=   Set Variable  ${return_value.replace(u'з ','')}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}
  [return]  ${return_value}

Отримати інформацію про tenderPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  tenderPeriod.endDate
  ${return_value}=   Set Variable  ${return_value.replace(u'по ','')}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}
  [return]  ${return_value}

Отримати інформацію про enquiryPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  enquiryPeriod.startDate
  ${return_value}=   Set Variable  ${return_value.replace(u'з ','')}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}
  [return]  ${return_value}

Отримати інформацію про enquiryPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці  enquiryPeriod.endDate
  ${return_value}=   Set Variable  ${return_value.replace(u'по ','')}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].description
  Sleep   10
  Відкрити розділ опис закупівлі
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].description
  [return]  ${return_value}

Отримати інформацію про items[0].unit.code
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].unit.code
  ${return_value}=   convert_unit_name_to_unit_code  ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].quantity
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].quantity
  ${return_value}=   Convert To Number   ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].classification.id
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.id
  [return]  ${return_value}

Отримати інформацію про items[0].classification.scheme
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.scheme
  ${return_value}=   Set Variable  ${return_value.split(u'КЛАСИФІКАТОР ')[1]}
  ${return_value}=   Set Variable  ${return_value.split(':')[0]}
  ${return_value}=   Set Variable  ${return_value.replace(' ', '')}
  [return]  ${return_value}

Отримати інформацію про items[0].classification.description
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].classification.description
  Run Keyword And Return  convert_etender_string_to_common_string  ${return_value}

Отримати інформацію про items[0].additionalClassifications[0].id
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].id
  [return]  ${return_value.split(' ')[0]}

Отримати інформацію про items[0].additionalClassifications[0].scheme
  ${return_value}=   Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].scheme
  ${return_value}=   Get Substring  ${return_value}   0   -1
  [return]  ${return_value.split(' ')[1]}

Отримати інформацію про items[0].additionalClassifications[0].description
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].additionalClassifications[0].description
  [return]  ${return_value}

Отримати інформацію про items[0].deliveryAddress.postalCode
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.postalCode
  Run Keyword And Return  Get Substring  ${return_value}  0  5

Отримати інформацію про items[0].deliveryAddress.countryName
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.countryName
  Run Keyword And Return  Get Substring  ${return_value}  0  7

Отримати інформацію про items[0].deliveryAddress.region
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.region
  ${return_value}=    convert_etender_string_to_common_string     ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].deliveryAddress.locality
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.locality
  ${return_value}=   Remove String      ${return_value}     ,
  ${return_value}=    convert_etender_string_to_common_string     ${return_value}
  [return]  ${return_value}

Отримати інформацію про items[0].deliveryAddress.streetAddress
  Run Keyword And Return  Отримати текст із поля і показати на сторінці  items[0].deliveryAddress.streetAddress

Отримати інформацію про items[0].deliveryDate.startDate
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryDate.startDate
  ${return_value}=   Set Variable  ${return_value.replace(u'з ','')}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}, 00:00
  [return]  ${return_value}

Отримати інформацію про items[0].deliveryDate.endDate
  ${return_value}=  Отримати текст із поля і показати на сторінці  items[0].deliveryDate.endDate
  ${return_value}=   Set Variable  ${return_value.replace(u'по ','')}
  ${return_value}=   convert_etender_date_to_iso_format   ${return_value}, 00:00
  [return]  ${return_value}

Отримати інформацію про questions[0].title
  sleep   10
  Відкрити розділ запитань
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].title
  [return]  ${return_value}

Отримати інформацію про questions[0].description
  Sleep   10
  Відкрити розділ запитань
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].description
  [return]  ${return_value}

Отримати інформацію про questions[0].date
  Sleep   3
  ${return_value}=   Отримати текст із поля і показати на сторінці   questions[0].date
  [return]  ${return_value}


Отримати інформацію про questions[0].answer
  Sleep   3
  Reload Page
  Sleep   10
  Відкрити розділ запитань
  ${return_value}=     Отримати текст із поля і показати на сторінці     questions[0].answer
  [return]  ${return_value}

Отримати інформацію про awards[0].complaintPeriod.endDate
  Sleep   10
  Відкрити розділ пропозицій
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].complaintPeriod.endDate
  ${return_value}=  Set Variable  ${return_value.replace(u'по ','')}
  ${return_value}=  convert_etender_date_to_iso_format_and_add_timezone   ${return_value}
  [return]  ${return_value}

Отримати інформацію про awards[0].status
  Sleep   10
  Відкрити розділ пропозицій
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].status
  ${return_value}=  Set Variable  ${return_value.strip()}
  ${return_value}=   convert_etender_string_to_common_string   ${return_value}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].address.countryName
  Sleep   10
  Відкрити розділ пропозицій
  Mouse Over  xpath=//span[@id="awardContactPoint"]
  Sleep  1
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].address.countryName
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].address.locality
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].address.locality
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].address.postalCode
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].address.postalCode
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].address.region
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].address.region
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].address.streetAddress
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].address.streetAddress
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].name
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].name
  [return]  ${return_value}

Отримати інформацію про awards[0].value.valueAddedTaxIncluded
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].value.valueAddedTaxIncluded
  ${return_value}=  Set Variable  ${return_value.strip()}
  ${return_value}=    convert_etender_string_to_common_string     ${return_value}
  [return]  ${return_value}

Отримати інформацію про awards[0].value.currency
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].value.currency
  # process values like this:   "   9 254,00 UAH, включаючи ПДВ  "
  ${return_value}=  Set Variable  ${return_value.strip()}
  ${return_value}=  Set Variable  ${return_value.split(',')[1]}
  ${return_value}=  Set Variable  ${return_value.split(' ')[1]}
  [return]  ${return_value}

Отримати інформацію про awards[0].value.amount
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].value.amount
  # process values like this  "   9 254,00 UAH, включаючи ПДВ  "
  ${return_value}=  Set Variable  ${return_value.strip()}
  ${part_one}=  Set Variable  ${return_value.split(',')[0]}
  ${part_two}=  Set Variable  ${return_value.split(',')[1]} # get fractional part with currency
  ${part_two}=  Set Variable  ${part_two.split(' ')[0]}  # remove currency and leave fractional part only
  ${part_one}=  Set Variable  ${part_one.replace(u'\xa0','')}
  ${part_one}=  Set Variable  ${part_one.replace(' ','')}
  ${return_value}=  Set Variable  ${part_one}.${part_two}
  ${return_value}=  Convert To Number  ${return_value}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].contactPoint.telephone
  Sleep   10
  Відкрити розділ пропозицій
  Mouse Over  xpath=//span[@id="awardContactPoint"]
  Sleep  1
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].contactPoint.telephone
  ${return_value}=  Set Variable  ${return_value.replace(u'Телефон: ','')}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].contactPoint.name
  Mouse Over  xpath=//li[@id="naviTitle0"]/span   # just to move cursor away
  Sleep  1
  Mouse Over  xpath=//span[@id="awardContactPoint"]
  Sleep  1
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].contactPoint.name
  ${return_value}=  Set Variable  ${return_value.replace(u'Контактна особа: ','')}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].contactPoint.email
  Mouse Over  xpath=//span[@id="awardContactPoint"]
  Sleep  1
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].contactPoint.email
  ${return_value}=  Set Variable  ${return_value.replace(u'email: ','')}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].identifier.scheme
  Mouse Over  xpath=//span[@id="awardContactPoint"]
  Sleep  1
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].identifier.scheme
  ${return_value}=  Set Variable  ${return_value.replace(u'Код ','')}
  ${return_value}=  Set Variable  ${return_value.split(':')[0]}
  ${return_value}=  Set Variable  ${return_value.replace(u"ЄДРПОУ","UA-EDR")}
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].identifier.legalName
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].identifier.legalName
  [return]  ${return_value}

Отримати інформацію про awards[0].suppliers[0].identifier.id
  ${return_value}=  Отримати текст із поля і показати на сторінці     awards[0].suppliers[0].identifier.id
  ${return_value}=  Set Variable  ${return_value.split(':')[1]}
  ${return_value}=  Set Variable  ${return_value.strip()}
  [return]  ${return_value}

Отримати інформацію про documents[0].title
  Sleep  10
  Відкрити розділ опис закупівлі
  # TODO move locator
  ${return_value}=  Get Text  xpath=//td[contains(@class,"doc-name")]//a
  [return]  ${return_value}

Отримати інформацію про awards[0].documents[0].title
  Sleep  10
  Відкрити розділ пропозицій
  Click Element  xpath=//label[@for="showAwards00"]  #
  Sleep  1
  # TODO move locator
  ${return_value}=  Get Text  xpath=//td[contains(@class,"doc-name")]//a
  [return]  ${return_value}

Отримати посилання на аукціон для глядача
  [Arguments]  @{ARGUMENTS}
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  60
  Page Should Contain Element  xpath=//a[contains(.,"Подивитись процедуру проведення аукціону")]
  Sleep  3
  ${url}=  Get Element Attribute  xpath=//a[contains(.,"Подивитись процедуру проведення аукціону")]@href
  [return]  ${url}

Отримати посилання на аукціон для учасника
  [Arguments]  @{ARGUMENTS}
  etender.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Відкрити розділ пропозицій
  Page Should Contain Element  xpath=//a[@id='participationUrl_0']
  Sleep  3
  ${url}=  Get Element Attribute  xpath=//*[@id="participationUrl_0"]@href
  [return]  ${url}

Отримати інформацію із предмету
  [Arguments]    ${user}    ${tender_uaid}    ${item_id}    ${fieldname}
  # TODO: remove old-style keywords and locators, like Отримати інформацію про items[0].classification.description
  Reload Page
  ${prepared_locator}=  Set Variable  ${locator_item_${field_name}}
  ${prepared_locator}=  Set Variable  ${prepared_locator.replace('XX_item_id_XX','${item_id}')}
  log  ${prepared_locator}
  sleep   10
  Відкрити розділ опис закупівлі
  Wait Until Page Contains Element  ${prepared_locator}  10
  Wait Until Keyword Succeeds  10 x  5  Check Is Element Loaded  ${prepared_locator}
  ${raw_value}=   Get Text  ${prepared_locator}
  ${fields_supported}=  Create List  description  classification.scheme  classification.id  classification.description  additionalClassifications[0].id  additionalClassifications[0].description  quantity  unit.name  unit.code  deliveryDate.endDate  deliveryAddress.countryName  deliveryAddress.postalCode  deliveryAddress.region  deliveryAddress.locality  deliveryAddress.streetAddress
  List Should Contain Value  ${fields_supported}  ${fieldname}
  Run Keyword And Return  Конвертувати інформацію із предмету про ${fieldname}  ${raw_value}

Конвертувати інформацію із предмету про description
  [Arguments]  ${raw_value}
  [return]  ${raw_value}

Конвертувати інформацію із предмету про classification.scheme
  [Arguments]  ${raw_value}
  ${raw_value}=      Set Variable  ${raw_value.split(u'КЛАСИФІКАТОР ')[1]}
  ${raw_value}=      Set Variable  ${raw_value.split(':')[0]}
  ${return_value}=   Set Variable  ${raw_value.replace(' ', '')}
  [return]  ${return_value}

Конвертувати інформацію із предмету про classification.id
  [Arguments]  ${raw_value}
  [return]  ${raw_value}

Конвертувати інформацію із предмету про classification.description
  [Arguments]  ${raw_value}
  [return]  ${raw_value}

Конвертувати інформацію із предмету про quantity
  [Arguments]  ${raw_value}
  ${return_value}=  Convert To Number  ${raw_value}
  [return]  ${return_value}

Конвертувати інформацію із предмету про unit.name
  [Arguments]  ${raw_value}
  [return]  ${raw_value}

Конвертувати інформацію із предмету про unit.code
  [Arguments]  ${raw_value}
  ${return_value}=  convert_unit_name_to_unit_code  ${raw_value}
  [return]  ${return_value}

Конвертувати інформацію із предмету про deliveryDate.endDate
  [Arguments]  ${raw_value}
  ${raw_value}=   Set Variable  ${raw_value.replace(u'по ','')}
  ${return_value}=  convert_etender_date_to_iso_format   ${raw_value}, 00:00
  [return]  ${return_value}

Конвертувати інформацію із предмету про deliveryAddress.countryName
  [Arguments]  ${raw_value}
  [return]  ${raw_value}

Конвертувати інформацію із предмету про deliveryAddress.postalCode
  [Arguments]  ${raw_value}
  [return]  ${raw_value}

Конвертувати інформацію із предмету про deliveryAddress.region
  [Arguments]  ${raw_value}
  ${return_value}=    convert_etender_string_to_common_string     ${raw_value}
  [return]  ${return_value}

Конвертувати інформацію із предмету про deliveryAddress.locality
  [Arguments]  ${raw_value}
  ${return_value}=   Remove String      ${raw_value}     ,
  ${return_value}=    convert_etender_string_to_common_string     ${return_value}
  [return]  ${return_value}

Конвертувати інформацію із предмету про deliveryAddress.streetAddress
  [Arguments]  ${raw_value}
  [return]  ${raw_value}

Отримати інформацію із запитання
  [Arguments]  ${username}  ${tender_uaid}  ${question_id}  ${field}
  Switch browser   ${username}
  Reload Page
  ${prepared_locator}=  Set Variable  ${locator_question_${field}.replace('XX_que_id_XX','${question_id}')}
  log  ${prepared_locator}
  sleep   10
  Відкрити розділ запитань
  Wait Until Page Contains Element  ${prepared_locator}  10
  Wait Until Keyword Succeeds  10 x  5  Check Is Element Loaded  ${prepared_locator}
  ${raw_value}=   Get Text  ${prepared_locator}
  Run Keyword And Return  Конвертувати інформацію із запитання про ${field}  ${raw_value}

Конвертувати інформацію із запитання про title
  [Arguments]  ${return_value}
  [return]  ${return_value}

Отримати інформацію із документа
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field}
  Switch browser   ${username}
  ${prepared_locator}=  Set Variable  ${locator_document_${field}.replace('XX_doc_id_XX','${doc_id}')}
  log  ${prepared_locator}
  Wait Until Page Contains Element  ${prepared_locator}  10
  ${raw_value}=   Get Text  ${prepared_locator}
  Run Keyword And Return  Конвертувати інформацію із документа про ${field}  ${raw_value}

Конвертувати інформацію із документа про title
  [Arguments]  ${raw_value}
  ${return_value}=  Set Variable  ${raw_value.split(',')[0]}
  [return]  ${return_value}

Конвертувати інформацію із документа про description
  [Arguments]  ${raw_value}
  ${return_value}=  Set Variable  ${raw_value.split('(')[1].replace(')','')}
  [return]  ${return_value}

Отримати документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
  ${title}=  etender.Отримати інформацію із документа  ${username}  ${tender_uaid}  ${doc_id}  title
  ${prepared_locator}=  Set Variable  ${locator_document_href.replace('XX_doc_id_XX','${doc_id}')}
  log  ${prepared_locator}
  ${href}=  Get Element Attribute  ${prepared_locator}
  ${document_file}=  download_file_from_url  ${href}  ${OUTPUT_DIR}${/}${title}
  [return]  ${document_file}

Отримати інформацію із лоту
  [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field_name}
  Switch browser   ${username}
  ${prepared_locator}=  Set Variable  ${locator_lot_${field_name}}
  ${prepared_locator}=  Set Variable  ${prepared_locator.replace('XX_lot_id_XX','${object_id}')}
  log  ${prepared_locator}
  Wait Until Page Contains Element  ${prepared_locator}  10
  ${raw_value}=   Get Text  ${prepared_locator}
  Run Keyword And Return  Конвертувати інформацію із лоту про ${field_name}  ${raw_value}

Конвертувати інформацію із лоту про title
  [Arguments]  ${return_value}
  [return]  ${return_value}

Конвертувати інформацію із лоту про description
  [Arguments]  ${return_value}
  [return]  ${return_value}

Конвертувати інформацію із лоту про value.currency
  [Arguments]  ${return_value}
  [return]  ${return_value}

Конвертувати інформацію із лоту про value.valueAddedTaxIncluded
  [Arguments]  ${return_value}
  ${return_value}=  Run Keyword If  'ПДВ' in '${return_value}'  Set Variable  True
    ...  ELSE  Set Variable  False
  Log  ${return_value}
  ${return_value}=   Convert To Boolean   ${return_value}
  [return]  ${return_value}

Конвертувати інформацію із лоту про value.amount
  [Arguments]  ${raw_value}
  ${return_value}=  parse_currency_value_with_spaces  ${raw_value} XX
  ${return_value}=  Convert To Number  ${return_value}
  [return]  ${return_value}

Конвертувати інформацію із лоту про minimalStep.amount
  [Arguments]  ${raw_value}
  ${return_value}=  parse_currency_value_with_spaces  ${raw_value}
  ${return_value}=  Convert To Number  ${return_value}
  [return]  ${return_value}

Конвертувати інформацію із лоту про minimalStep.valueAddedTaxIncluded
  [Arguments]  ${return_value}
  ${return_value}=  Run Keyword If  'ПДВ' in '${return_value}'  Set Variable  True
    ...  ELSE  Set Variable  False
  Log  ${return_value}
  ${return_value}=   Convert To Boolean   ${return_value}
  [return]  ${return_value}

Конвертувати інформацію із лоту про minimalStep.currency
  [Arguments]  ${raw_value}
  ${return_value}=  get_minimalStep_currency  ${raw_value}
  [return]  ${return_value}

Отримати інформацію із нецінового показника
  [Arguments]  ${username}  ${tender_uaid}  ${object_id}  ${field_name}
  Reload Page
  Sleep  4
  ${open_item_feature_locator}=  Set Variable  //div[contains(@ng-if,"lot.items") and contains(@id,"tree")]//span[@data-toggle="collapse"]/span[contains(.,"критерії оцінки")]
  Run Keyword And Ignore Error  scrollIntoView by script using xpath  ${open_item_feature_locator}
  sleep   2
  Run Keyword And Ignore Error  Click Element  xpath=${open_item_feature_locator}  # open Нецінові (якісні) критерії оцінки section to make its text visible
  Sleep  2

  Run Keyword And Return  Отримати інформацію із нецінового показника про ${field_name}  ${object_id}

Отримати інформацію із нецінового показника про title
  [Arguments]  ${object_id}
  Run Keyword And Return  Get Text  xpath=//span[contains(.,'${object_id}')]

Отримати інформацію із нецінового показника про description
  [Arguments]  ${object_id}
  Run Keyword And Return  Get Text  xpath=//span[contains(.,'${object_id}')]/../../..//span[contains(@ng-bind, "description")]

Отримати інформацію із нецінового показника про featureOf
  [Arguments]  ${object_id}
  Run Keyword And Return  Get Element Attribute  xpath=//span[contains(.,'${object_id}')]@name

Відкрити розділ опис закупівлі
  scrollIntoView by script using xpath  //li[@id="naviTitle0"]/span  # scroll to опис закупівлі tab
  sleep   1
  Click Element                      xpath=//li[@id="naviTitle0"]/span  # go to опис закупівлі tab

Відкрити розділ пропозицій
  sleep   1
  scrollIntoView by script using xpath  //li[@id="naviTitle1"]/span  # scroll to bids tab
  sleep   1
  Click Element                      xpath=//li[@id="naviTitle1"]/span  # go to bids tab
  Wait Until Page Does Not Contain   ${locator_block_overlay}

Відкрити розділ вимог і скарг
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  scrollIntoView by script using xpath  //li[@id="naviTitle3"]/span  # scroll to complaints
  Click Element                      xpath=//li[@id="naviTitle3"]/span  # go to complaints
  Wait Until Page Does Not Contain   ${locator_block_overlay}

Відкрити розділ контактні дані
  scrollIntoView by script using xpath  //li[@id="naviTitle4"]/span  # scroll to контактні дані
  sleep   1
  Click Element                      xpath=//li[@id="naviTitle4"]/span  # go to контактні дані

Створити постачальника, додати документацію і підтвердити його
  [Arguments]  ${username}  ${tender_uaid}  ${object}  ${document}
  # TODO: investgate to remove this workaround.
  # This workaround was added to make telephone adapted for our broker, since all non-digit symbols are ignored on input
  ${telephone}=  Get From Dictionary   ${USERS.users['${username}'].supplier_data.data.suppliers[0].contactPoint}  telephone
  Set To Dictionary  ${USERS.users['${username}'].supplier_data.data.suppliers[0].contactPoint}  telephone=${telephone.replace('-', '')}
  Sleep  30
  Wait Until Keyword Succeeds   10 min  20 x  Wait for upload before signing  # there: button - Перейти до підпису"
  Select From List By Label  id=CAsServersSelect  Тестовий ЦСК АТ "ІІТ"
  ${key_dir}=  Normalize Path  ${CURDIR}/../../
  Choose File  id=PKeyFileInput  ${key_dir}/Key-6.dat
  Sleep  5
  ${PKeyPassword}=  Get File  password.txt
  Input text  id=PKeyPassword  ${PKeyPassword}
  Click Element  id=PKeyReadButton
  Sleep  10
  Click Element  id=SignDataButton
  Sleep  5
  Click Element  xpath=//div[@id="modalSign"]//button[contains(@class,"close")]
  Sleep  30

  Reload Page
  Sleep  5
  Відкрити розділ пропозицій
  ${amount}=             Get From Dictionary  ${object.data.value}  amount
  ${supplier_name}=      Get From Dictionary  ${object.data.suppliers[0]}               name
  ${supplier_code}=      Get From Dictionary  ${object.data.suppliers[0].identifier}    id
  ${supplier_subcInfo}=  Get From Dictionary  ${object.data.suppliers[0].identifier}    legalName
#  ${qualified}=          Get From Dictionary  ${object.data}                            qualified
  ${countryName}=        Get From Dictionary  ${object.data.suppliers[0].address}       countryName
  ${region}=             Get From Dictionary  ${object.data.suppliers[0].address}       region
  ${locality}=           Get From Dictionary  ${object.data.suppliers[0].address}       locality
  ${streetAddress}=      Get From Dictionary  ${object.data.suppliers[0].address}       streetAddress
  ${postalCode}=         Get From Dictionary  ${object.data.suppliers[0].address}       postalCode
  ${contact_name}=       Get From Dictionary  ${object.data.suppliers[0].contactPoint}  name
  ${contact_email}=      Get From Dictionary  ${object.data.suppliers[0].contactPoint}  email
  ${contact_url}=        Get From Dictionary  ${object.data.suppliers[0].contactPoint}  url
  ${contact_phone}=      Get From Dictionary  ${object.data.suppliers[0].contactPoint}  telephone
  ${contact_fax}=        Get From Dictionary  ${object.data.suppliers[0].contactPoint}  faxNumber

  ${amount}=  float_to_string_2f  ${amount}
  Input text  name=amount0  ${amount}
  # TODO: read curency from dict
  Select From List By Label  id=currency  грн
  Input text  name=orgName0  ${supplier_name}
  Input text  name=orgCode0  ${supplier_code}
  Input text  name=subcInfo  ${supplier_subcInfo}
# TODO: use qualified from dict
  Click Element              xpath=//div[@ng-if="!detailes.isLimitedReporting"]//input[1]  # Відповідність кваліфікаційним критеріям: Відповідає
  Select From List By Label  xpath=//select[@ng-model="data.country"]  ${countryName}
  Run Keyword If  '${region}' == 'місто Київ'  Select From List By Label  xpath=//*[contains(@id,"_region")]  Київ
  Run Keyword If  '${region}' != 'місто Київ'  Run Keywords
  ...  Select From List By Label  xpath=//*[contains(@id,"_region")]     ${region}
  ...  AND  Input text            xpath=//*[contains(@name,"_newCity")]  ${locality}
  Input text  xpath=//*[contains(@name,"_addressStr")]  ${streetAddress}
  Input text  xpath=//*[contains(@name,"_postIndex")]   ${postalCode}
  Input text  name=cpName0  ${contact_name}
  Input text  id=email  ${contact_email}
  Input text  id=url  ${contact_url}
  Input text  id=phone  ${contact_phone}
  Input text  id=fax  ${contact_fax}
  Click Element  id=btnCreateAward

  Sleep  30
  Reload Page
  Sleep  5
  Відкрити розділ пропозицій
  Click Element  xpath=//a[@data-target="#modalGetAwards"]  # button - Оцінка документів Кандидата
  Select From List By Label  id=docType  Повідомлення про рішення
  Sleep   5
  # TODO: Rework this tricky behavior someday?
  # Autotest cannot upload file directly, because there is no INPUT element on page. Need to click on button first,
  # but this will open OS file selection dialog. So we close and reopen browser to get rid of this dialog
  ${tmp_location}=  Get Location
  Click Element   xpath=//button[@ng-model="lists.documentsToAdd"]
  Choose File     xpath=//input[@type="file" and @ng-model="lists.documentsToAdd"]  ${document}
  Sleep   4
  Click Element   xpath=//button[@ng-click="downloadDocsGetAward(lists.documentsToAdd)"]
  Sleep   1
  Capture Page Screenshot
  Sleep   2
  Close Browser
  etender.Підготувати клієнт для користувача  ${username}
  Go To  ${tmp_location}
  Sleep  5
  Відкрити розділ пропозицій
  Capture Page Screenshot
  Wait Until Keyword Succeeds   10 min  20 x  Wait for upload  # there: button - Оцінка документів Кандидата

  Click Element  xpath=//button[@ng-click="getAwardsNextStep()"]        # button - Наступний крок
  Sleep  5
  Click Element  xpath=//button[@ng-click="showSignModalAward(award)"]  # button - Підписати рішення
  Sleep  10
  # now - sign! again ---------------------------------------------------------
  Select From List By Label  id=CAsServersSelect  Тестовий ЦСК АТ "ІІТ"
  ${key_dir}=  Normalize Path  ${CURDIR}/../../
  Choose File  id=PKeyFileInput  ${key_dir}/Key-6.dat
  Sleep  5
  ${PKeyPassword}=  Get File  password.txt
  Input text  id=PKeyPassword  ${PKeyPassword}
  Click Element  id=PKeyReadButton
  Sleep  10
  Click Element  id=SignDataButton
  Sleep  5
  Sleep  5
  Click Element  xpath=//div[@id="modalSign"]//button[contains(@class,"close")]
  Sleep  30
# shall be signed here -------------------------------------------------------------
  Wait Until Keyword Succeeds   10 min  20 x  Wait for upload  # there: button - Оцінка документів Кандидата
  Click Element  xpath=//button[@ng-click="getAwardsNextStep()"]        # button - Наступний крок
  Capture Page Screenshot
  Sleep  5
  Capture Page Screenshot
  Click Element  xpath=//button[@click-and-block="setDecision(1)"]      # button - Підтвердити
  Sleep  5
  Capture Page Screenshot
  Sleep   2

Wait for upload
  Reload Page
  Sleep  10
  scrollIntoView by script using xpath  //a[@data-target="#modalGetAwards"]  # button - Оцінка документів Кандидата
  sleep   2
  Click Element  xpath=//a[@data-target="#modalGetAwards"]              # button - Оцінка документів Кандидата
  Sleep  5
  Page Should Not Contain  Не всі документи експортовані

Wait for upload before signing
  Reload Page
  Sleep  10
  scrollIntoView by script using xpath  //button[contains(.,"Перейти до підпису")]
  Click Element  xpath=//button[contains(.,"Перейти до підпису")]
  Sleep  1
  Page Should Not Contain  Не всі документи експортовані
  Page Should Not Contain  Не всі документи экспортовано до Центральної бази.
  Wait Until Element Is Visible  id=CAsServersSelect

Підтвердити підписання контракту
  [Arguments]  ${username}  ${tender_uaid}  ${contract_index}
  Log  Temporary sleep to compensate timings, let's wait for 1 minute to be sure  WARN
  Sleep  60
  Reload Page
  Sleep  5
  Відкрити розділ пропозицій
  ${tmp_location_tender}=  Get Location

# ==================  1 - enter values into fields, save
  Click Element  xpath=//a[.="Внести інформацію про договір"]
  Sleep  10
  Input text  id=contractNumber  ${contract_index}
  ${time_now_tmp}=     get_time_now
  ${date_now_tmp}=     get_date_now
  ${date_future_tmp}=  get_date_10d_future
  Input text  name=dateSigned  ${date_now_tmp}
  Input text  name=timeSigned  ${time_now_tmp}
  Input text  name=endDate     ${date_future_tmp}
  scrollIntoView by script using xpath  //button[@data-target="#saveData"]  # button - Опублікувати документи та завершити пізніше
  sleep   2
  Click Element  xpath=//button[@data-target="#saveData"]  # button - Опублікувати документи та завершити пізніше
  Sleep  10
  Click Element  xpath=//div[@id="saveData"]//button[@ng-click="save(documentsToAdd)"]


# ==================  2 - wait for upload
  Sleep  60  # wait for upload
  Go To  ${tmp_location_tender}
  Sleep  5
  Capture Page Screenshot
  Відкрити розділ пропозицій
  scrollIntoView by script using xpath  //a[.="Редагувати інформацію про договір "]
  sleep   2
  Click Element  xpath=//a[.="Редагувати інформацію про договір "]
  Sleep  10

# ==================  3 - upload doc

  Select From List By Label  id=docType  Підписаний договір
  Sleep   5
  # TODO: Rework this tricky behavior someday?
  # Autotest cannot upload file directly, because there is no INPUT element on page. Need to click on button first,
  # but this will open OS file selection dialog. So we close and reopen browser to get rid of this dialog
  Click Element   xpath=//button[@ng-model="documentsToAdd"]
  ${file_path}  ${file_name}  ${file_content}=   create_fake_doc
  Choose File     xpath=//input[@type="file" and @ng-model="documentsToAdd"]  ${file_path}
  Sleep   1
  Capture Page Screenshot
  Sleep   2

  Sleep  60  # wait for upload
  Close Browser
  etender.Підготувати клієнт для користувача  ${username}
  Go To  ${tmp_location_tender}
  Sleep  5
  Capture Page Screenshot
  Відкрити розділ пропозицій
  scrollIntoView by script using xpath  //a[.="Редагувати інформацію про договір "]
  sleep   2
  Click Element  xpath=//a[.="Редагувати інформацію про договір "]
  Sleep  10
  ${methodType}=  Get From Dictionary  ${USERS.users['${username}']}  method_type
  Run Keyword If  '${methodType}' == 'aboveThresholdEU'  Підтвердити контракт додаванням ЕЦП
  Run Keyword If  '${methodType}' == 'aboveThresholdUA'  Підтвердити контракт додаванням ЕЦП
  Run Keyword If  '${methodType}' == 'negotiation'       Підтвердити контракт додаванням ЕЦП
  scrollIntoView by script using xpath  //button[@click-and-block="sign()"]
  sleep   2
  Click Element  xpath=//button[@click-and-block="sign()"]  # button - Завершити закупівлю
  Sleep  1
  Capture Page Screenshot
  Wait Until Page Contains  Підтверджено!  60

Підтвердити контракт додаванням ЕЦП
  scrollIntoView by script using xpath  //button[@click-and-block="showSignModalContract(contract)"]
  sleep   2
  Click Element  xpath=//button[@click-and-block="showSignModalContract(contract)"]  # button - Накласти ЕЦП на договір
  Sleep  5
  # now - sign! again ---------------------------------------------------------
  Select From List By Label  id=CAsServersSelect  Тестовий ЦСК АТ "ІІТ"
  ${key_dir}=  Normalize Path  ${CURDIR}/../../
  Choose File  id=PKeyFileInput  ${key_dir}/Key-6.dat
  Sleep  5
  ${PKeyPassword}=  Get File  password.txt
  Input text  id=PKeyPassword  ${PKeyPassword}
  Click Element  id=PKeyReadButton
  Sleep  10
  Click Element  id=SignDataButton
  Sleep  5
  Capture Page Screenshot
  Click Element  xpath=//div[@id="modalSign"]//button[contains(@class,"close")]
  Sleep  1
  Capture Page Screenshot
  Sleep  30
# shall be signed here -------------------------------------------------------------
  Capture Page Screenshot
  Sleep  30
  Capture Page Screenshot
  Reload Page
  Sleep  5

Відповісти на вимогу про виправлення умов закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}
  # TODO: remove workaround and open complaint using given complaintID
  ${tmp_hacked_title}=  Get From Dictionary  ${USERS.users['Tender_User'].tender_claim_data.claim.data}  title
  ${tmp_hacked_id}=  Get From Dictionary  ${USERS.users['Tender_User'].tender_claim_data}  complaintID
  log  ${tmp_hacked_id}
  ${tmp_hacked_title}=  Run Keyword If  '${tmp_hacked_id}' != '${complaintID}'  temporary keyword for title update  ${USERS.users['Tender_User'].lot_claim_data}  ${complaintID}
  ...   ELSE  Set Variable  ${tmp_hacked_title}
  Reload Page
  Sleep   25
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Відкрити розділ вимог і скарг
  Wait Until Element Is Visible  xpath=//a[@role="button" and @aria-expanded="false" and contains(.,"${tmp_hacked_title}")]
  Sleep  5
  Click Element  xpath=//a[@role="button" and @aria-expanded="false" and contains(.,"${tmp_hacked_title}")]
  Sleep  5
  Wait Until Element Is Visible  xpath=(//button[@ng-click="showAnswerComplaintModal(currentComplaint)"])[1]  # button - відповісти
  Sleep  10
  scrollIntoView by script using xpath  (//button[@ng-click="showAnswerComplaintModal(currentComplaint)"])[1]  # button - відповісти
  sleep   2
  Click Element  xpath=(//button[@ng-click="showAnswerComplaintModal(currentComplaint)"])[1]
  Sleep  5
  ${resolution}=      Get From Dictionary  ${answer_data.data}  resolution
  ${resolutionType}=  Get From Dictionary  ${answer_data.data}  resolutionType
  ${tendererAction}=  Get From Dictionary  ${answer_data.data}  tendererAction
  Input text  id=tenderAction   ${tendererAction}
  Input text  id=descriptionEl  ${resolution}
  Select From List By Value  id=resolutionTypeEl  ${resolutionType}
  Sleep  1
  Click Element  id=btnanswerComplaint

Відповісти на вимогу про виправлення визначення переможця
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}  ${award_index}
  # TODO: rework duplicated code - see "Відповісти на вимогу про виправлення умов закупівлі"
  # TODO: remove workaround and open complaint using given complaintID
  ${tmp_hacked_title}=  Get From Dictionary  ${USERS.users['Tender_User'].claim_data.claim.data}  title
  Reload Page
  Sleep   10
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Відкрити розділ вимог і скарг
  Wait Until Element Is Visible  xpath=//a[@role="button" and @aria-expanded="false" and contains(.,"${tmp_hacked_title}")]
  Sleep  5
  Click Element  xpath=//a[@role="button" and @aria-expanded="false" and contains(.,"${tmp_hacked_title}")]
  Sleep  5
  Wait Until Element Is Visible  xpath=(//button[@ng-click="showAnswerComplaintModal(currentComplaint)"])[1]  # button - відповісти
  Sleep  10
  scrollIntoView by script using xpath  (//button[@ng-click="showAnswerComplaintModal(currentComplaint)"])[1]  # button - відповісти
  sleep   2
  Click Element  xpath=(//button[@ng-click="showAnswerComplaintModal(currentComplaint)"])[1]
  Sleep  5
  ${resolution}=      Get From Dictionary  ${answer_data.data}  resolution
  ${resolutionType}=  Get From Dictionary  ${answer_data.data}  resolutionType
  ${tendererAction}=  Get From Dictionary  ${answer_data.data}  tendererAction
  Input text  id=tenderAction   ${tendererAction}
  Input text  id=descriptionEl  ${resolution}
  Select From List By Value  id=resolutionTypeEl  ${resolutionType}
  Sleep  1
  Click Element  id=btnanswerComplaint

temporary keyword for title update
  [Arguments]  ${lot_claim_data}  ${complaintID}
  ${tmp_hacked_title}=  Get From Dictionary  ${lot_claim_data.claim.data}  title
  ${tmp_hacked_id}=     Get From Dictionary  ${lot_claim_data}             complaintID
  [return]  ${tmp_hacked_title}

Завантажити документ рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${document}  ${tender_uaid}  ${award_num}
  Sleep  3
  # TODO: rework duplicated code - see "Створити постачальника, додати документацію і підтвердити його"
  etender.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Відкрити розділ пропозицій
  Click Element  xpath=//a[@data-target="#modalGetAwards"]  # button - Оцінка документів Кандидата
  Select From List By Label  id=docType  Повідомлення про рішення
  Sleep   5
  # TODO: Rework this tricky behavior someday?
  # Autotest cannot upload file directly, because there is no INPUT element on page. Need to click on button first,
  # but this will open OS file selection dialog. So we close and reopen browser to get rid of this dialog
  ${tmp_location}=  Get Location
  Click Element   xpath=//button[@ng-model="lists.documentsToAdd"]
  Choose File     xpath=//input[@type="file" and @ng-model="lists.documentsToAdd"]  ${document}
  Sleep   4
  Click Element   xpath=//button[@ng-click="downloadDocsGetAward(lists.documentsToAdd)"]
  Wait Until Page Contains  Документи завантажено! Очікуйте синхронізацію з ЦБД.  30
  Close Browser
  etender.Підготувати клієнт для користувача  ${username}
  Go To  ${tmp_location}
  Sleep  5
  Відкрити розділ пропозицій
  Wait Until Keyword Succeeds   10 min  20 x  Wait for upload  # there: button - Оцінка документів Кандидата
  Reload Page

Підтвердити постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  # TODO: rework duplicated code - see "Створити постачальника, додати документацію і підтвердити його"
  etender.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Does Not Contain   ${locator_block_overlay}
  Sleep   4
  Відкрити розділ пропозицій
  Click Element  xpath=//a[@data-target="#modalGetAwards"]  # button - Оцінка документів Кандидата
  Sleep   1
  Click Element  xpath=//button[@ng-click="getAwardsNextStep()"]        # button - Наступний крок
  Sleep  5
  Click Element  xpath=//button[@click-and-block="setDecision(1)"]      # button - Підтвердити
  Sleep  5
