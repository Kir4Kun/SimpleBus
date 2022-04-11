import { Bus } from '../buses/db';
import { BusStop } from '../busstops/db';
import { supabase } from '../supabase'

export type BusStatus = {
    id: number;
    startStop: BusStop;
    nextStop: BusStop;
    endStop: BusStop;
    direction: number;
}

export async function getBusStatusById(id: string) {
    const { data, error } = await supabase.from('busStatus').select(`
        id,
        startStop:startStopId(*),
        nextStop:nextStopId(*),
        endStop:endStopId(*),
        direction
    `).eq('busId', id).single()

    if (error) {
        throw error
    }

    return data as BusStatus
}