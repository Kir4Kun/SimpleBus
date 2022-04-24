import { Bus } from '../buses/db'
import { BusStop } from '../busstops/db'
import { supabase } from '../supabase'

export type Route = {
    id: number;
    bus: Bus;
    stopOrder: number;
    busStop: BusStop;
}
export async function getAllRoutes() {
    const { data, error } = await supabase
        .from<Route>('routes')
        .select(`
            id,
            bus:busId(*),
            stopOrder,
            busStop:busStopId(*)
        `)
    if (error) {
        throw error
    }
    return data
}

export async function getRouteByBusId(id: string) {
    const { data, error } = await supabase
        .from('routes')
        .select(`
            id,
            stopOrder,
            busStop:busStopId(*)
        `)
        .order('stopOrder', { ascending: true })
        .eq('busId', id)
    if (error) {
        throw error
    }
    return data as Route[]
}

export async function searchRoutes(from: string, to: string) {
    const { data: fromRoutes, error } = await supabase
        .from('routes')
        .select(`
            busId,
            busStop: busStops!inner(*)
        `)
        .eq('busStop.name', from)
    if (error) {
        throw error
    }

    let busIds = fromRoutes?.map(route => route.busId) as string[]

    const { data: toRoutes } = await supabase
        .from('routes')
        .select(`
            bus: buses!inner(*),
            busStop: busStops!inner(*)
        `)
        .in('bus.id', busIds)
        .eq('busStop.name', to)

    busIds = toRoutes?.map(route => route.bus.id) as string[]

    const { data: routes } = await supabase
        .from('buses')
        .select(`*`)
        .in('id', busIds)

    return routes as Route[]
}