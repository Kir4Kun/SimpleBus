import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://oaqjdqstnjhhvbooxecf.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hcWpkcXN0bmpoaHZib294ZWNmIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY0ODU3NTA5NSwiZXhwIjoxOTY0MTUxMDk1fQ.lvoLIf3kUWlUzLa4U7oUA6UD6LXDKFHdDdIR4wiDtV4'
export const supabase = createClient(supabaseUrl, supabaseKey)