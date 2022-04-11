import { supabase } from '../supabase';

export type BusStop = {
    id: number;
    latitude: number;
    longitude: number;
    name: string;
}

export async function getBuStops() {
    const { data, error } = await supabase
        .from<BusStop>('busStops')
        .select('*')

    if (error) {
        throw error
    }
    return data
}

export async function getBusStopById(id:string) {
    const { data, error } = await supabase
        .from<BusStop>('busStops')
        .select('*')
        .eq('id', id)
        .single()

    if (error) {
        throw {
            code: 404,
        message: `Busstop with ${id} not found`
        }
    }
    return data
}