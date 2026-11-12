// Arabic string catalog. Add keys; never hardcode Arabic in JSX.
export const ar = {
  app: {
    name: 'المحروسة',
    tagline: 'نظام الكاشير',
  },
  auth: {
    login:       'تسجيل الدخول',
    code:        'كود الموظف',
    password:    'كلمة المرور',
    submit:      'دخول',
    logout:      'خروج',
    bad_creds:   'كود الموظف أو كلمة المرور غير صحيحة',
    required:    'هذا الحقل مطلوب',
  },
  nav: {
    pos:         'نقطة البيع',
    invoices:    'الفواتير',
    items:       'الأصناف',
    reports:     'التقارير',
    settings:    'الإعدادات',
  },
  pos: {
    open_shift:   'فتح وردية',
    point:        'المنفذ',
    shift_kind:   'نوع الوردية',
    shift_date:   'تاريخ الوردية',
    new_invoice:  'فاتورة جديدة',
    table_no:     'رقم الترابيزة',
    person_count: 'عدد الأشخاص',
    add_item:     'إضافة صنف',
    remove:       'حذف',
    qty:          'الكمية',
    price:        'السعر',
    line_total:   'إجمالي الصنف',
    subtotal:     'المجموع',
    service:      'الخدمة',
    discount:     'الخصم',
    total:        'الإجمالي',
    close:        'إقفال وسداد',
    cancel:       'إلغاء الفاتورة',
    print:        'طباعة',
    confirm_cancel: 'هل أنت متأكد من إلغاء الفاتورة؟',
  },
  invoice: {
    status: {
      OPEN:      'مفتوحة',
      PAID:      'مسددة',
      CANCELLED: 'ملغاة',
    },
    type: {
      1: 'ترابيزة',
      2: 'غرفة',
      3: 'إذن مدير',
      4: 'مبلغ ثابت',
      5: 'موظف',
    } as Record<number, string>,
    empty_lines: 'الفاتورة فارغة',
  },
  common: {
    loading:  'جارٍ التحميل...',
    save:     'حفظ',
    cancel:   'إلغاء',
    retry:    'إعادة المحاولة',
    error:    'حدث خطأ',
  },
};

export type I18n = typeof ar;
