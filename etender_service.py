# -*- coding: utf-8 -

from iso8601 import parse_date
from datetime import datetime, date, time, timedelta
import dateutil.parser
from pytz import timezone
import os

TZ = timezone(os.environ['TZ'] if 'TZ' in os.environ else 'Europe/Kiev')

def get_all_etender_dates(initial_tender_data, key, subkey=None):
    tender_period = initial_tender_data.data.tenderPeriod
    start_dt = dateutil.parser.parse(tender_period['startDate'])
    end_dt = dateutil.parser.parse(tender_period['endDate'])
    data = {
        'StartDate': {
            'date': start_dt.strftime("%d-%m-%Y"),
            'time': start_dt.strftime("%H:%M"),
        },
        'EndDate': {
            'date': end_dt.strftime("%d-%m-%Y"),
            'time': end_dt.strftime("%H:%M"),
        },
    }
    if 'enquiryPeriod' in initial_tender_data.data:
        enquiry_period = initial_tender_data.data.enquiryPeriod
        end_period = dateutil.parser.parse(enquiry_period['endDate'])
        data['EndPeriod'] = {
            'date': end_period.strftime("%d-%m-%Y"),
            'time': end_period.strftime("%H:%M"),
        }
    else:
        if 'EndPeriod' in key:
            raise
    dt = data.get(key, {})
    return dt.get(subkey) if subkey else dt


def parse_etender_date(date):
    # converts date from ui to datetime
    return datetime.strptime(date, '%d-%m-%Y, %H:%M')


def to_iso(date):
    return date.isoformat()

def convert_etender_date_to_iso_format(date):
    return TZ.localize(parse_etender_date(date)).isoformat()


def convert_date_to_etender_format(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%d-%m-%Y")
    return date_string


def convert_datetime_for_delivery(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%Y-%m-%d %H:%M")
    return date_string


def convert_time_to_etender_format(isodate):
    iso_dt = parse_date(isodate)
    time_string = iso_dt.strftime("%H:%M")
    return time_string


def float_to_string_2f(value):
    return '{:.2f}'.format(value)


def string_to_float(string):
    return float(string)


def change_data(initial_data):
    #TODO: remove redundant hardcoded values
    initial_data['data']['items'][0]['deliveryAddress']['locality'] = u"м. Київ"
    initial_data['data']['items'][0]['deliveryAddress']['region'] = u"Київська область"
    initial_data['data']['procuringEntity']['name'] = u"TenderOwner#"
    initial_data['data']['procuringEntity']['address']['locality']       = u"Алупка"
    initial_data['data']['procuringEntity']['address']['postalCode']     = u"13531"
    initial_data['data']['procuringEntity']['address']['region']         = u"АР Крим"
    initial_data['data']['procuringEntity']['address']['streetAddress']  = u"Фрунзе, 666"
    initial_data['data']['procuringEntity']['contactPoint']['name']      = u"Владелец Этого Тендера"
    initial_data['data']['procuringEntity']['contactPoint']['telephone'] = u"613371488228"
    initial_data['data']['procuringEntity']['contactPoint']['url']       = u"http://e-tender.ua/"
    initial_data['data']['procuringEntity']['identifier']['legalName']   = u"TenderOwner#"
    initial_data['data']['procuringEntity']['identifier']['id']          = u"88008800"
    return initial_data


def convert_etender_date_to_iso_format_and_add_timezone(date):
    return TZ.localize(parse_etender_date(date)).isoformat()


def get_time_now():
    time_string = datetime.now().strftime("%H:%M")
    return time_string


def get_date_now():
    date_string = datetime.now().strftime("%d-%m-%Y")
    return date_string


def get_date_10d_future():
    date_string = (datetime.now() + timedelta(days=10)).strftime("%d-%m-%Y")
    return date_string


def convert_common_string_to_etender_string(string):
    dict = get_helper_dictionary()
    for key, val in dict.iteritems():
        if val == string:
            return key
    return string


def parse_currency_value_with_spaces(raw):
    # to convert raw values like '2 216 162,83 UAH' to string which is ready for conversion to float
    return ''.join(raw.split(' ')[:-1]).replace(',','.')

def get_minimalStep_currency(raw_value):
    # to get currency 'UAH' from raw values like '2 216 162,83 UAH'
    result_dic = raw_value.split(' ')
    result = result_dic[-1]
    return result

def convert_etender_string_to_common_string(string):
    return get_helper_dictionary().get(string, string)


def hack_phone_add_dashes(input):
    #  hardcoded for 7-digit phone, UA - like 4260712, and convert to -> 426-07-12
    dig_3  = input[:3]
    dig_2a = input[3:5]
    dig_2b = input[5:]
    output = dig_3 + '-' + dig_2a + '-' + dig_2b
    return output


def get_helper_dictionary():
    return {
        u"кг.": u"кілограм",
        u"грн.": u"UAH",
        u"(включаючи ПДВ)": True,
        u"включаючи ПДВ": True,
        u"без ПДВ":       False,
         u"Київ": u"місто Київ",
        # TODO: remove this temporary workaround, consult with quinta team about input data
        u"Дніпро": u"Дніпропетровськ",
        #tender statuses
        u'період уточнень': u'active.enquiries',
        u'очікування пропозицій': u'active.tendering',
        u'прекваліфікація': u'active.pre-qualification',
        u'блокування перед аукціоном': u'active.pre-qualification.stand-still',
        u'період аукціону': u'active.auction',
        u'кваліфікація переможця': u'active.qualification',
        u'пропозиції розглянуто': u'active.awarded',
        u'завершена закупівля': u'complete',
        u'закупівля не відбулась': u'unsuccessful',
        u'відмінена закупівля': u'cancelled',
        #bid statuses
        u'Пропозиція не дійсна': u'invalid',
        u"ст.35 ч. 2 п. 1": u"artContestIP",
        u"ст.35 ч. 2 п. 2": u"noCompetition",
        u"ст.35 ч. 2 п. 4": u"twiceUnsuccessful",
        u"ст.35 ч. 2 п. 5": u"additionalPurchase",
        u"ст.35 ч. 2 п. 6": u"additionalConstruction",
        u"ст.35 ч. 2 п. 7": u"stateLegalServices",
        u"Договір поки що не опубліковано": u"pending",
        u"Договір опубліковано": u"active",
        u"Переможець торгів": u"active"
    }

def get_feature_index(i):
    return {0.05: '1',
            0.01: '2',
            0: '3'}[i]

def get_doc_type_index(i):
    return {'financial_documents': '1',
            'qualification_documents': '2',
            'eligibility_documents': '3'}.get(i, i)

def convert_unit_name_to_unit_code(string):
    return {
        u"блок": u"D64",
        u"гектар": u"HAR",
        u"кілограми": u"KGM",
        u"кілометри": u"KMT",
        u"літр": u"LTR",
        u"лот": u"LO",
        u"метри квадратні": u"MTK",
        u"метри кубічні": u"MTQ",
        u"метри": u"MTR",
        u"місяць": u"MON",
        u"набір": u"SET",
        u"пара": u"PR",
        u"пачка": u"RM",
        u"пачок": u"NMP",
        u"послуга": u"E48",
        u"рейс": u"E54",
        u"тони": u"TNE",
        u"упаковка": u"PK",
        u"Флакон": u"VI",
        u"штуки": u"H87",
        u"ящик": u"BX",
    }.get(string, string)

