import csv
import cStringIO
from io import BytesIO
from datetime import datetime, timedelta
import logging

#from reportlab.lib import colors
#from reportlab.lib.enums import TA_CENTER, TA_LEFT, TA_RIGHT, TA_JUSTIFY
#from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
#from reportlab.lib.units import inch
#from reportlab.lib.pagesizes import letter
#from reportlab.platypus import Paragraph, SimpleDocTemplate, Spacer, Table, TableStyle
#from core import utils as core_utils

from django.conf import settings
from django.core.mail import EmailMessage
from django.db.models import Avg, Min, Max

from .models import Department, Duty, Staff, Partner, Asset, Vulnerability, Threat, Vul_analysis, Risk_analysis, Risk_control

class Stats(object):

	def _stats(self):
		stats = {
			'department_count': self.data.count(),
			'duty_count': self.data.count(),
			'staff_count': self.data.count(),
			'partner_count': self.data.count(),
			'asset_count': self.data.count(),
			'vulnerability_count': self.data.count(),
			'threat_count': self.data.count(),
			'vul_analysis_count': self.data.count(),
			'risk_analysis_count': self.data.count(),
			'risk_control_count': self.data.count(),
		}
		return stats

