import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://oaqjdqstnjhhvbooxecf.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hcWpkcXN0bmpoaHZib294ZWNmIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY1MDgwMTcxMSwiZXhwIjoxOTY2Mzc3NzExfQ.PadZuCLriPpTMS78DIZOV0prnr8izXffS1b9E2JmHS8'
export const supabase = createClient(supabaseUrl, supabaseKey)